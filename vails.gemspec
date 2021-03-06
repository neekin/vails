$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "vails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "vails"
  spec.version     = Vails::VERSION
  spec.authors     = ["NeeKin"]
  spec.email       = ["njgzs360@gmail.com"]
  spec.homepage    = "https://github.com/neekin/vails"
  spec.summary     = "a simple vue scaffold on rails."
  spec.description = "a simple vue scaffold on rails."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/vails"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "railties",  ">= 6.0.1"
end
