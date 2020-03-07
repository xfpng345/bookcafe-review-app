# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'geocoder'
gem 'gmaps4rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'fog-aws'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.8'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development, :test do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :production, :staging do
  gem 'unicorn', '5.5.1'
end
