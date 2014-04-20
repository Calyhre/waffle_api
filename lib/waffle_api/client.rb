require 'waffle_api/helpers'
require 'waffle_api/address_validator'

module WaffleAPI
  # A Ruby class to call the Waffle stat API. You might use this if you want to
  # retrieve your waffle pool stats from within a Ruby program.
  #
  # Example:
  #
  #   require 'waffle_api'
  #   stats = WaffleAPI::Client.new address: '<BTC_ADDRESS_HERE>'
  #   stats.create()
  #
  class Client
    include WaffleAPI::Helpers
    include WaffleAPI::AddressValidator

    attr_accessor :address, :https_only

    def initialize(address: nil, https_only: false, ignore_bad_address: false)
      @address   = address || ENV['BTC_ADDRESS']
      @https_only = https_only

      fail Error::EmptyAddress if @address.nil? || @address.empty?
      fail Error::BadAddress, @address unless valid_address? || ignore_bad_address
    end

    def hashrate
      stats 'hash_rate'
    end

    def method_missing(method, *args, &block)
      stats method.to_s
    rescue Error::UnknownKey
      super method, *args, &block
    end
  end
end
