if ENV['TRAVIS']
  require 'coveralls'
  require 'codeclimate-test-reporter'
  Coveralls.wear!
  CodeClimate::TestReporter.start
end

require 'waffle_api'
require 'webmock/rspec'
require 'faker'
require 'factory_girl'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

WebMock.disable_net_connect! allow_localhost: true, allow: 'codeclimate.com'

BTC_ADDRESS = '1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V'
URL = "http://wafflepool.com/tmp_api?address=#{BTC_ADDRESS}"

def stub_waffle_with(response_class)
  stub_request(:any, URL).to_rack(response_class)
end
