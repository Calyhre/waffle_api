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

  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'sinatra', '~> 1.4'
  s.add_development_dependency 'webmock', '~> 1.17'
  s.add_development_dependency 'coveralls', '~> 0.7'
end
