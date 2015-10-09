$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tones/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tones"
  s.version     = Tones::VERSION
  s.authors     = ["Harpal"]
  s.email       = ["harpalsinghgr@gmail.com"]
  s.homepage    = "https://rubygems.org/gems/tones"
  s.summary     = "Pluggin for translation"
  s.description = "Tones provide translation feature with user interface and import export feature for update translations in app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', "~> 4.2", ">= 4.0"
  s.add_development_dependency "sqlite3"
end
