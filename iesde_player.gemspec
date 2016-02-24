$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "iesde_player/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "iesde_player"
  s.version     = IesdePlayer::VERSION
  s.authors     = ["Pedro Benevides"]
  s.email       = ["pedro.augusto.sb@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of IesdePlayer."
  s.description = "TODO: Description of IesdePlayer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
end
