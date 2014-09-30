# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ama_validators/version'

Gem::Specification.new do |spec|
  spec.name          = "ama_validators"
  spec.version       = AmaValidators::VERSION
  spec.authors       = ["Michael van den Beuken", "Ruben Estevez", "Jordan Babe", "Mathieu Gilbert", "Ryan Jones", "Darko Dosenovic"]
  spec.email         = ["michael.beuken@gmail.com", "ruben.a.estevez@gmail.com", "jorbabe@gmail.com", "mathieu.gilbert@ama.ab.ca", "ryan.michael.jones@gmail.com", "darko.dosenovic@ama.ab.ca"]
  spec.description   = "Compile the following validators: - Credit card - Email - Membership number - Phone number - Postal code"
  spec.summary       = "This gem will compile the following validators - Credit card - Email - Membership number - Phone number - Postal code. With this gem there is no need for the validators classes."
  spec.homepage      = "https://github.com/amaabca/ama_validators"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-instafail"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_dependency "rails", ">= 3.0.0"

end
