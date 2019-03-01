source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.1'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.1.3'
gem 'jquery-rails'
gem 'pg'
gem 'slim-rails'
gem 'redcarpet'
gem 'valid_email2', '~> 2.3.0'
gem 'phonelib', '~> 0.6.24'
gem 'validates_zipcode'
gem 'jquery-ui-rails'
gem 'rails-i18n'
gem 'devise'
gem 'sneakers', '~> 2.7.0'
gem 'json-prettyprint'
gem 'faker'
gem 'rails_locale_detection'
gem 'listen', '>= 3.0.5', '< 3.2'
# emails
gem 'inky-rb', require: 'inky'
gem 'premailer-rails'
gem 'telebot', :git => 'https://github.com/khalilgharbaoui/telebot.git'
# Excel sheets generation
gem 'rubyzip', '>= 1.2.1'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: 'c8ac844'
gem 'axlsx_rails', '>= 0.5.1'
# Pdf Generation
gem 'wicked_pdf', github: 'mileszs/wicked_pdf'
gem 'wkhtmltopdf-binary-edge', '~> 0.12.2.1'
gem 'cre', '~>0.1.3'

group :development, :test do
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rspec_boolean'
  gem 'rubocop', '~> 0.58.2'
  # gem 'nyan-cat-formatter'
  # gem 'fuubar'
  gem 'binding_of_caller'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'better_errors'

  gem "capistrano", "~> 3.11", require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-passenger'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano-rails-console'
  # gem 'capistrano-rvm'
  gem 'capistrano-rbenv'
  gem 'capistrano-rake', '~> 0.2.0', require: false
  gem 'capistrano-sudo', require: false

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier-guard'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'spring-commands-rspec'
  gem 'seed_dump'
  gem 'rails_email_preview', '~> 2.0.6'
  gem 'meta_request'
  gem 'rack-mini-profiler', require: false
  # For memory profiling
  gem 'memory_profiler'
  # For call-stack profiling flamegraphs
  gem 'flamegraph'
  gem 'stackprof'
  gem 'annotate', git: 'https://github.com/ctran/annotate_models.git'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
end
gem 'sentry-raven'
gem 'bugsnag'
# rails performance reporting
gem 'skylight'
