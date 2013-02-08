# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'finch/version'

Gem::Specification.new do |s|
  s.name          = "finch"
  s.version       = Finch::VERSION
  s.authors       = ["chatgris"]
  s.email         = ["jboyer@af83.com"]
  s.homepage      = "https://github.com/chatgris/finch"
  s.summary       = "Barebone Ping dashboard"
  s.description   = "Finch provides an easy to setup dashboard for ping monitoring."
  s.files         = `git ls-files README.md LICENSE lib`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.add_dependency "celluloid"
  s.add_dependency "net-ping"
  s.add_dependency "sinatra"
  s.add_dependency "slim"
end
