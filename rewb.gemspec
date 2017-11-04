# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rewb/version'

Gem::Specification.new do |spec|
  spec.name          = "rewb"
  spec.version       = Rewb::VERSION
  spec.authors       = ["Daniel Rødskog"]
  spec.email         = ["danielmero@gmail.com"]

  spec.summary       = %q{Convenience methods and operators}
  spec.description   = %q{Pure greatness}
  spec.homepage      = "http://github.com/daniero/rewb"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.4'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.5"
  spec.add_development_dependency "rspec", "~> 3.7"
end
