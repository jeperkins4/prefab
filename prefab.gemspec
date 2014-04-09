# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prefab/generators/version"

Gem::Specification.new do |spec|
  spec.name          = "prefab"
  spec.version       = Prefab::Generators::VERSION
  spec.authors       = ["John Perkins"]
  spec.email         = ["jeperkins4@gmail.com"]
  spec.summary       = %q{Prefab provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1).}
  spec.description   = %q{Prefab provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1). Checkout http://getbootstrap.com.}
  spec.homepage      = "https://github.com/jeperkins4/prefab"
  spec.license       = "MIT"

  spec.rubyforge_project = "prefab"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "railties", ">= 3.1.0"
end
