# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gen_mit/version"

Gem::Specification.new do |spec|
  spec.name          = "gen_mit"
  spec.version       = GenMit::VERSION
  spec.authors       = ["284km"]
  spec.email         = ["at284km@gmail.com"]

  spec.summary       = "Generate MIT LICENSE.txt."
  spec.description   = "Generate MIT LICENSE.txt."
  spec.homepage      = "https://github.com/284km/gen_mit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-temp_dir"
end
