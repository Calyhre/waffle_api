require 'waffle_api/errors'
require 'net/http'
require 'openssl'
require 'json'
require 'uri'

module WaffleAPI
  # List of helpers used in WaffleAPI
  module Helpers
    NOT_FOUND_ERROR = 'Invalid BTC Address!'
    INVALIDATION_TIME = 30 # Seconds

    def call_uri
      URI "#{WAFFLEPOOL_URL}#{WAFFLEPOOL_API_PATH}?address=#{@address}"
    end

    def request_json
      response = Net::HTTP.get_response call_uri
      fail Error::EndPointMoved if response.is_a? Net::HTTPNotFound

      json = JSON.parse response.body
      fail Error::AddressNotFound, @address if json['error'] == NOT_FOUND_ERROR
      fail Error::UnknownError, json['error'] unless json['error'].empty?
      json.delete 'error'
      json
    end

    def data_recent?
      @retrieved_at && @retrieved_at > Time.now - INVALIDATION_TIME
    end

    def data_recent!
      @retrieved_at = Time.now
    end

    def stats(key, force_update = false)
      @datas ||= []

      if !data_recent? || force_update
        @datas = request_json
        data_recent!
      end

      fail Error::UnknownKey, key if @datas[key].nil?

      @datas[key]
    end
  end
end
