require 'sinatra/base'

# Stub WafflePool reponses
module Wafflepool
  # Provide json_reponse for all inherited class
  class Base < Sinatra::Base
    protected

    def json_response(response_code, file_name)
      content_type :json
      status response_code
      File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
    end
  end

  # Stub success response from WafflePool
  class Success < Base
    get '/tmp_api' do
      json_response 200, 'success.json'
    end
  end

  # Stub unknown error response from WafflePool
  class UnknownError < Base
    get '/tmp_api' do
      json_response 200, 'error.json'
    end
  end

  # Stub address not found response from WafflePool
  class AddressNotFound < Base
    get '/tmp_api' do
      json_response 200, 'not_found.json'
    end
  end

  # Stub api endpoint moved
  class EndPointMoved < Base
    get '/tmp_api' do
      status 404
      body nil
    end
  end
end
