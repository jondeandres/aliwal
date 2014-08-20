$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weather/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weather"
  s.version     = Weather::VERSION
  s.authors     = ["Jon de Andres"]
  s.email       = ["jondeandres@gmail.com"]
  s.homepage    = "http://github.com/jondeandres/aliwal"
  s.summary     = "Weather module for aliwal"
  s.description = "Weather module for aliwal"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
	s.add_dependency 'addressable'
end
