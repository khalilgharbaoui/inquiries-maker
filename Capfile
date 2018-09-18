# Load DSL and Setup Up Stages
require 'capistrano/setup'
# Includes default deployment tasks
require 'capistrano/deploy'
require "capistrano/scm/git"
  install_plugin Capistrano::SCM::Git
require 'capistrano/passenger'
require 'capistrano/rails'
require 'capistrano/rake'
# require 'capistrano/rvm'
require 'capistrano/rbenv'
require 'capistrano/sudo'
require 'capistrano/bundler'




# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks helpers from `lib/capistrano/' if you have any defined.
Dir.glob('lib/capistrano/*.rb').each { |r| import r }
# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
