# frozen_string_literal: true

# lock to capistrano version
lock '~> 3.11.0'
set :ssh_options, forward_agent: true, keys: ['config/deploy_id_rsa'] if File.exist?('config/deploy_id_rsa')
# Include this if you want to be able to set up different deployment stages (i.e. beta, stage, etc.)
# require 'capistrano/ext/multistage'
set :application, 'inquiries-maker'
set :rails_env, 'production'
set :full_app_name, "#{fetch(:application)}_#{fetch(:rails_env)}"
set :repo_url, 'git@github.com:khalilgharbaoui/inquiries-maker.git'
set :config_files,  %w(monit)
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_to, '/home/inquiries-maker/web/app/'
set :format, :pretty
set :log_level, :debug
# set :pty, true
set :bundle_jobs, 16
set :keep_releases, 1

# Defaults to nil (no asset cleanup is performed)
set :keep_assets, 1

# Defaults to :db role
set :migration_role, :app

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
set :assets_roles, %i[web app]

# Defaults to 'assets'
# This should match config.assets.prefix in your rails config/application.rb
set :assets_prefix, 'prepackaged-assets'

# Defaults to ["/path/to/release_path/public/#{fetch(:assets_prefix)}/.sprockets-manifest*", "/path/to/release_path/public/#{fetch(:assets_prefix)}/manifest*.*"]
# This should match config.assets.manifest in your rails config/application.rb
set :assets_manifests, ['app/assets/config/manifest.js']

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets

# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %w[public/images public/javascripts public/stylesheets]

append :linked_files, 'config/master.key', 'config/database.yml', 'config/certs/ssl.key', 'config/certs/ssl.crt'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

set(:symlinks, [
  {
    source: 'monit',
    link:   "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
  }
])

set :passenger_restart_with_touch, true

namespace :monit do
  desc "Restart monit daemon monitoring"
  task :restart do
    on roles(:app) do
      sudo "/etc/init.d/monit restart"
    end
  end
end

namespace :notify do
  desc "Send Telegram Notification"
  task :telegram do
    on roles(:app) do
      execute :sendtelegram, '-c /etc/telegramrc -m "Deploy done! ✅"'
    end
  end
end

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc "Check if HEAD is same as origin/#{fetch(:branch)}"
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  before :starting, 'deploy:check_revision'
  # before :starting, 'workers:stop'

  # after :started, 'workers:stop'

  # before :finishing, 'workers:stop'
  before :finishing, 'deploy:cleanup'

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     within release_path do
  #       execute :rake, 'cache:clear'
  #     end
  #   end
  # end
  after 'deploy:setup_config', 'monit:restart'
end

namespace :workers do
  desc 'Start workers...'
  task :start do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :ps, "-ef | awk '/[r]ake workers:run/{print $2}'" # get pids
          execute :sleep, '2'
          execute :echo, 'Starting workers....❕'
          execute :sleep, '2'
          SSHKit.config.command_map.prefix[:rake].unshift('nohup')
          execute :rake, "workers:run RAILS_ENV=production --trace > #{deploy_to}rake.out 2>&1 &"
          execute :sleep, '2'
          execute :sleep, '2'
          execute :ps, "-ef | awk '/[r]ake workers:run/{print $2}'" # get pids
        end
      end
    end
  end

  desc 'Kill workers by PID'
  task :stop do
    on roles(:app) do
      execute :ps, "-ef | awk '/[r]ake workers:run/{print $2}'" # get pids
      execute :sleep, '2'
      execute :ps, " -ef | awk '/[r]ake workers:run/{print $2}' | xargs kill -9"
      execute :sleep, '2'
      execute :sleep, '2'
      execute :ps, "-ef | awk '/[r]ake workers:run/{print $2}'" # get pids
      execute :echo, 'Workers died....❕'

    end
  end
  desc 'show workers PIDs...'
  task :ids do
    on roles(:app) do
      execute :sleep, '2'
      execute :ps, "-ef | awk '/[r]ake workers:run/{print $2}'" # get pids
      execute :sleep, '1'
    end
  end

  desc 'show workers logs...'
  task :logs do
    on roles(:app) do
      within release_path do
        execute :pgrep, "-f 'rake workers'"
        execute :tail, "-f #{deploy_to}rake.out"
      end
    end
  end
end

namespace :broker do
  desc 'Start RabbitMQ server...'
  task :start do
    on roles(:app), in: :groups, limit: 3, wait: 11 do
      sudo! :service, "rabbitmq-server start"
      # sudo! :rabbitmqctl, "status"
    end
  end

  desc 'Stop RabbitMQ server...'
  task :stop do
    on roles(:app), in: :groups, limit: 3, wait: 11 do
      sudo! :service, "rabbitmq-server stop"
    end
  end

  desc 'Restart RabbitMQ server...'
  task :restart do
    on roles(:app), in: :groups, limit: 3, wait: 11 do
      sudo! :service, 'rabbitmq-server restart'
    end
  end

  desc 'RabbitMQ server status...'
  task :status do
    on roles(:app), in: :groups, limit: 3, wait: 11 do
      sudo! :service, 'rabbitmq-server status | cat'
    end
  end

  # desc 'RabbitMQ queue list...'
  # task :queue_list do
    # on roles(:app), in: :groups, limit: 3, wait: 11 do
      # sudo! :rabbitmqadmin, 'list queues name messages messages_ready messages_unacknowledged'
    # end
  # end
end

namespace :services do
  desc 'Check status of all running services'
  task :status do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      sudo! :service, '--status-all'
    end
  end
end

namespace :logs do
  desc 'Ouput the tail from remote log'
  task :tail do
    on roles(:app) do
      within current_path do
        execute :tail, "-f log/#{fetch(:rails_env) || 'production'}.log"
      end
    end
  end

  desc 'Ouputs the full remote log'
  task :full do
    on roles(:app) do
      within current_path do
        puts(capture(:cat, "log/#{fetch(:rails_env) || 'production'}.log"))
      end
    end
  end

  desc 'Ouput the last 100 lines of tail from remote log'
  task :last do
    on roles(:app) do
      within current_path do
        puts(capture(:tail, "-n 100 log/#{fetch(:rails_env) || 'production'}.log"))
      end
    end
  end
end
