require 'coveralls'
Coveralls.wear!

require 'webmock/rspec'
require 'waffle_api'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

WebMock.disable_net_connect! allow_localhost: true

BTC_ADDRESS = '1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V'
URL = "http://wafflepool.com/tmp_api?address=#{BTC_ADDRESS}"

def stub_waffle_with(response_class)
  stub_request(:any, URL).to_rack(response_class)
end
