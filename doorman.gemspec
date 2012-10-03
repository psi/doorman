# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doorman/version'

Gem::Specification.new do |gem|
  gem.name          = "doorman"
  gem.version       = Doorman::VERSION
  gem.authors       = ["JD Harrington"]
  gem.email         = ["jd@jdharrington.net"]
  gem.description   = <<-EOF
    Doorman is a Sinatra application that lets you track IP addresses that are
    engaging in potentially abusive activity, set rules for what constitutes a
    ban, and then spits out a list of banned IP addresses suitable for including
    in an nginx configuration file.
  EOF
  gem.summary       = %q{This is the doorman}
  gem.homepage      = "http://github.com/psi/doorman"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "sinatra", "~> 1.3"
  gem.add_dependency "thin"

  gem.add_dependency "ohm"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "tux"
  gem.add_development_dependency "shotgun"
  gem.add_development_dependency "foreman"
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "rack-test"
end
