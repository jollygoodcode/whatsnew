# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whatsnew/version"

Gem::Specification.new do |spec|
  spec.name          = "whatsnew"
  spec.version       = Whatsnew::VERSION
  spec.authors       = ["Juanito Fatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = %q{Find out what's new about a project}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/jollygoodcode/whatsnew"
  spec.license       = "MIT"

  spec.bindir = "bin"
  spec.executables << "whatsnew"

  spec.require_paths = ["lib"]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
end
