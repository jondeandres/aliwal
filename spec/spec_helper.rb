ENV["RAILS_ENV"] ||= 'test'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.include(RequestsFixtures)
end
