# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gplanner/version"

Gem::Specification.new do |spec|
  spec.name          = "gplanner"
  spec.version       = Gplanner::VERSION
  spec.authors       = ["Abu Nashir"]
  spec.email         = ["abunashir@gmail.com"]

  spec.summary       = "Git/Goal Planner"
  spec.description   = "Git/Goal Planner"
  spec.homepage      = "https://github.com/abunashir/gplanner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = "planner"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19.4"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler"
end
