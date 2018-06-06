# lock to capistrano version
lock "~> 3.11.0"
# Include this if you want to be able to set up different deployment stages (i.e. beta, stage, etc.)
# require 'capistrano/ext/multistage'
set :application, 'inquiries-maker'
set :rails_env, 'production'
set :rvm_ruby_version, '2.5.1'
set :repo_url, 'git@github.com:khalilgharbaoui/inquiries-maker.git'
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# overwrite flags with the added -d to deamonize the Process of bundle
set :deploy_to, '/home/inquiries-maker/web/app/'
set :format, :pretty
# set :log_level, :debug
# set :pty, true
set :keep_releases, 5

# Defaults to nil (no asset cleanup is performed)
set :keep_assets, 2

# Defaults to :db role
set :migration_role, :app

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
set :assets_roles, [:web, :app]

# Defaults to 'assets'
# This should match config.assets.prefix in your rails config/application.rb
set :assets_prefix, 'prepackaged-assets'

# Defaults to ["/path/to/release_path/public/#{fetch(:assets_prefix)}/.sprockets-manifest*", "/path/to/release_path/public/#{fetch(:assets_prefix)}/manifest*.*"]
# This should match config.assets.manifest in your rails config/application.rb
set :assets_manifests, ['app/assets/config/manifest.js']

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets

# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}

append :linked_files, "config/master.key", "config/database.yml", "config/certs/ssl.key", "config/certs/ssl.crt"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :start_workers do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: fetch(:rails_env) do
            SSHKit.config.command_map.prefix[:rake].unshift("nohup")
            execute :rake, "workers:run RAILS_ENV=production --trace > #{deploy_to}rake.out 2>&1 &"
        end
      end
    end
  end
  # TODO:
  # task :stop_workers do
  # end
  task :start_broker do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      # service rabbitmq-server start
      execute :service, "rabbitmq-server start"
    end
  end
  task :stop_broker do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      # service rabbitmq-server start
      execute :service, "rabbitmq-server stop"
    end
  end
  task :restart_broker do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      # service rabbitmq-server start
      execute :service, "rabbitmq-server restart"
    end
  end
  after :finishing, 'deploy:cleanup'
  after :restart, 'deploy:start_workers'
end

# TODO:
# after :restart, :clear_cache do
#   on roles(:web), in: :groups, limit: 3, wait: 10 do
#     # Here we can do anything such as:
#     within release_path do
#       execute :rake, 'cache:clear'
#     end
#   end
# end
