require 'waffle_api/helpers'
require 'waffle_api/address_validator'
require 'waffle_api/worker'
require 'waffle_api/balances'
require 'waffle_api/payment'

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

    attr_accessor :address

    def initialize(address: nil)
      @address   = address || ENV['BTC_ADDRESS']

      fail Error::EmptyAddress if @address.nil? || @address.empty?
      fail Error::BadAddress, @address unless valid_address?
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
      balances = stats 'balances'

      WaffleAPI::Balances.new(
        sent: balances['sent'],
        confirmed: balances['confirmed'],
        unconverted: balances['unconverted']
      )
    end

    def payments
      stats('recent_payments').map do |payment|
        WaffleAPI::Payment.new(
          amount: payment['amount'],
          paid_at: payment['time'],
          transaction_hash: payment['txn']
        )
      end
    end

    # This is for not yet suported keys
    def method_missing(method, *args, &block)
      stats method.to_s
    rescue Error::UnknownKey
      super method, *args, &block
    end
  end
end
