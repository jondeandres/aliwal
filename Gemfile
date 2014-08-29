$:.unshift(File.expand_path('../lib', __FILE__))
require 'aliwal/modules'

source 'https://rubygems.org'

Aliwal::Modules.load_gemfiles(self)

gem 'rails', '4.1.1'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'redis'
gem 'ffi-rzmq'
gem 'nokogiri'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'byebug'
  gem 'pry'
  gem 'pry-doc'
  gem 'simplecov'
end
