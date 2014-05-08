# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_encryption/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_encryption"
  spec.version       = EasyEncryption::VERSION
  spec.authors       = ["Adam Ervans"]
  spec.email         = ["aervans@gmail.com"]
  spec.description   = %q{Check the github page for a detailed description}
  spec.summary       = %q{Adds easy to use encrypt and decrypt methods to string instances.}
  spec.homepage      = "https://github.com/aervans/easyencryption"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_dependency "rbnacl", "~> 3.0.0"
end
