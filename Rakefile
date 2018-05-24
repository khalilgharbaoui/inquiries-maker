# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

# For rabitMQ
require 'sneakers/tasks'

Rails.application.load_tasks

#NOTE: NEED TO MOVE TO TASKS!!
# FactoryBot factory spec
if defined?(RSpec)
  desc 'Run factory specs.'
  RSpec::Core::RakeTask.new(:factory_specs) do |t|
    t.pattern = './spec/factories_spec.rb'
  end
end

task factories: :factory_specs
