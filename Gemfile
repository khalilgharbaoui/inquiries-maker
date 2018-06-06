source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.1'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'pg'
gem 'slim-rails'
gem "valid_email2"
gem "phonelib"
gem 'validates_zipcode'
gem 'jquery-ui-rails'
gem 'rails-i18n'
gem 'devise'
gem 'sneakers', '~> 2.7.0'
gem 'json-prettyprint'
gem 'faker'
gem 'listen', '>= 3.0.5', '< 3.2'


group :development, :test do
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
  # gem "nyan-cat-formatter"
  # gem 'fuubar'
  gem "binding_of_caller"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'better_errors'

  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.4", require: false
  gem 'capistrano-passenger'
  gem 'capistrano-bundler', '~> 1.3'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano-rake', require: false

  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier-guard'

  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
  gem 'seed_dump'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
end
