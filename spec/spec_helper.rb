ENV["RAILS_ENV"] ||= 'test'

require 'aliwal'
require 'simplecov'
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

SimpleCov.adapters.define 'aliwal' do
  add_filter 'vendor'
  add_filter 'spec'
  add_filter 'config'
end

SimpleCov.start 'aliwal' if ENV['COVERAGE']

RSpec.configure do |config|
  config.include(RequestsFixtures)
  config.disable_monkey_patching!
end
