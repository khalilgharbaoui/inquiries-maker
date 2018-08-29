# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InquiriesMaker
  class Application < Rails::Application
    # ActiveJob using sneakers using RabitMQ
    config.active_job.queue_adapter = :sneakers
    # ActiveJob using sneakers using sidekiq
    # config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # Whitelist locales available for the application
    # default locale language code
    config.i18n.default_locale = :de
    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = %i[de fr en]

    # allow the entire app to be embedded in an iframe
    # config.action_dispatch.default_headers.merge!({'X-Frame-Options' => 'ALLOWALL'})
  end
end
