require File.expand_path('../lib/waffle_api/version', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'waffle_api'
  s.version      = WaffleAPI::VERSION
  s.summary      = 'Waffle pool API gem'
  s.description  = s.summary
  s.authors      = ['Calyhre']
  s.email        = ['contact@calyh.re']
  s.require_path = 'lib'
  s.homepage     = 'http://github.com/Calyhre/waffle_api'
  s.license      = 'MIT'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'sinatra'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'coveralls'
end
