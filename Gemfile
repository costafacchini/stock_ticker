# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.1'

gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.4'
gem 'sqlite3', '~> 1.4'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false

gem 'rack-cors'

gem 'webmock', '3.14.0', group: :test

gem 'rubocop', '~> 1.64', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop-factory_bot', '2.26.1', require: false
  gem 'rubocop-performance', '1.21.0', require: false
  gem 'rubocop-rails', '2.25.0', require: false
  gem 'rubocop-rspec', '3.0.1', require: false
  gem 'rubocop-rspec_rails', '2.30.0', require: false
end
