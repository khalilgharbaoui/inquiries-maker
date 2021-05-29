# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'faker'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'json-prettyprint'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'pg'
gem 'phonelib', '~> 0.6.24'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.6'
gem 'rails-i18n'
gem 'rails_locale_detection'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'sneakers', '~> 2.7.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'valid_email2', '~> 2.3.0'
gem 'validates_zipcode'
# emails
gem 'inky-rb', require: 'inky'
gem 'premailer-rails'
gem 'ahoy_email', '~> 1.1.0'
# telegram
gem 'telebot', github: 'khalilgharbaoui/telebot'
# Excel sheets generation
# gem 'axlsx', github: 'randym/axlsx', ref: 'c8ac844'
# gem 'axlsx_rails', '>= 0.5.1'
gem 'caxlsx'
gem 'caxlsx_rails'

gem 'rubyzip', '>= 1.2.1'
# Pdf Generation
gem 'cre', '~>0.1.3'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary-edge-alpine', '~> 0.12.5.0'
# Chart Generation
gem "chartkick", ">= 3.4.0"
gem 'groupdate'
gem 'dig-deep'

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
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'

  # gem 'capistrano', '~> 3.11', require: false
  # gem 'capistrano-bundler', '~> 1.3'
  # gem 'capistrano-passenger'
  # gem 'capistrano-rails', '~> 1.4', require: false
  # gem 'capistrano-rails-console'
  # # gem 'capistrano-rvm'
  # gem 'capistrano-rake', '~> 0.2.0', require: false
  # gem 'capistrano-rbenv'
  # gem 'capistrano-sudo', require: false

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'

  gem 'meta_request'
  gem 'rack-mini-profiler', require: false
  gem 'rails_email_preview', '~> 2.0.6'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'seed_dump'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier-guard'
  # For memory profiling
  gem 'memory_profiler'
  # For call-stack profiling flamegraphs
  gem 'annotate'
  gem 'flamegraph'
  gem 'stackprof'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end
gem 'sentry-raven'
# rails performance reporting
gem 'skylight', '= 5.0.1'
