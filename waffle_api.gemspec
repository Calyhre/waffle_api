require File.expand_path('../lib/waffle_api/version', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'waffle_api'
  s.version      = WaffleAPI::VERSION
  s.summary      = 'Waffle pool API gem'
  s.description  = s.summary
  s.authors      = ['Calyhre']
  s.email        = ['contact@calyh.re']
  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.homepage     = 'http://rubygems.org/gems/waffle_api'
  s.license      = 'MIT'
end
