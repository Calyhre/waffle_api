require 'waffle_api/helpers'
require 'waffle_api/address_validator'
require 'waffle_api/worker'
require 'waffle_api/balances'

module WaffleAPI
  # A Ruby class to call the Waffle stat API. You might use this if you want to
  # retrieve your waffle pool stats from within a Ruby program.
  #
  # Example:
  #
  #   require 'waffle_api'
  #   stats = WaffleAPI::Client.new address: '<BTC_ADDRESS_HERE>'
  #
  class Client
    include WaffleAPI::Helpers
    include WaffleAPI::AddressValidator

    attr_accessor :address, :https_only

    def initialize(address: nil, ignore_bad_address: false)
      @address   = address || ENV['BTC_ADDRESS']
      @https_only = https_only

      fail Error::EmptyAddress if @address.nil? || @address.empty?
      fail Error::BadAddress, @address unless valid_address? || ignore_bad_address
    end

    def hashrate
      stats 'hash_rate'
    end

    def workers
      stats('worker_hashrates').map do |worker|
        WaffleAPI::Worker.new(
          name: worker['username'],
          hash_rate: worker['hashrate'],
          stale_rate: worker['stalerate'],
          last_seen: worker['last_seen']
        )
      end
    end

    def balances
      balances = stats('balances')

      WaffleAPI::Balances.new(
        sent: balances['sent'],
        confirmed: balances['confirmed'],
        unconverted: balances['unconverted']
      )
    end

    def method_missing(method, *args, &block)
      stats method.to_s
    rescue Error::UnknownKey
      super method, *args, &block
    end
  end
end
