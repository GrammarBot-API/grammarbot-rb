# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grammarbot/version'

Gem::Specification.new do |spec|
  spec.name          = "grammarbot"
  spec.version       = Grammarbot::VERSION
  spec.authors       = ["Timur Valeev"]
  spec.email         = ["kibenimatik@yandex.ru"]

  spec.summary       = %q{Client library for GrammarBot API}
  spec.description   = %q{Gem wrapper for GrammarBot API for detecting grammar and spelling errors}
  spec.homepage      = "https://github.com/GrammarBot-API/grammarbot-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
