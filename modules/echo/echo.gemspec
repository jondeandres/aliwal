$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "echo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "echo"
  s.version     = Echo::VERSION
  s.authors     = ["Jon de Andres"]
  s.email       = ["jondeandres@gmail.com"]
  s.homepage    = ""
  s.summary     = "Echo module for Aliwal"
  s.description = "Echo module for Aliwal"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
end
