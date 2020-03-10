source 'https://rubygems.org'
ruby "2.4.4"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'active_interaction', '~> 3.6'
gem 'addressable'
gem 'attr_encrypted'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-deployment', require: 'dotenv/deployment'
gem 'dotenv-rails'
gem 'enumerize'
gem 'ffaker'
gem 'font-awesome-rails'
gem 'haml'
gem 'hashie'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'mechanize'
gem 'mysql2', '0.4.10'
gem 'nokogiri'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'responders'
gem 'rest-client'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sidekiq-unique-jobs'
gem 'therubyracer'
gem 'two_captcha'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'will_paginate'
gem 'will_paginate-bootstrap'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'pry-byebug'
  gem 'pry-rails' # Better console output
  gem 'selenium-webdriver'
end

group :test do
  gem 'action-cable-testing'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'launchy'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'poltergeist'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'annotate'
  gem "capistrano", require: false
  gem "capistrano-rails", require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'exception_notification'
end
