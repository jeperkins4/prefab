# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prefab/version"

Gem::Specification.new do |spec|
  spec.name          = "prefab"
  spec.version       = Prefab::VERSION
  spec.authors       = ["John Perkins"]
  spec.email         = ["jeperkins4@gmail.com"]
  spec.summary       = %q{Prefab provides Twitter Bootstrap generators for Rails 5 (supported Rails >= 5.0.1).}
  spec.description   = %q{Prefab provides Twitter Bootstrap generators for Rails 5 (supported Rails >= 5.0.1). Checkout http://getbootstrap.com.}
  spec.homepage      = "https://github.com/jeperkins4/prefab"
  spec.license       = "MIT"

  spec.rubyforge_project = "prefab"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'

  spec.add_runtime_dependency "railties", ">= 5.0.1"
end
