require 'coveralls'
Coveralls.wear!

require 'webmock/rspec'
require 'waffle_api'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

WebMock.disable_net_connect! allow_localhost: true

URL = 'http://wafflepool.com/tmp_api?address=1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V'

def stub_waffle(response_class)
  stub_request(:any, URL).to_rack(response_class)
end
