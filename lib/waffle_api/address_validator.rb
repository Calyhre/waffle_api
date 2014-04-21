require 'digest'

module WaffleAPI
  # Module use to deeply validate BTC address
  # From https://gist.github.com/alexandrz/4491729
  module AddressValidator
    private

    def valid_address?
      (@address =~ /^[a-zA-Z1-9]{33,35}$/) && DigestUtilities.version(@address)
    end

    # Utilities are in a class to make them private
    class DigestUtilities
      B58_CHARS = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'
      B58_BASE = B58_CHARS.length

      def self.version(address)
        decoded  = b58_decode(address, 25)
        version  = decoded[0, 1]
        checksum = decoded[-4, decoded.length]
        vh160    = decoded[0, decoded.length - 4]
        vh160_digest = (Digest::SHA2.new << vh160).digest
        hashed   = (Digest::SHA2.new << vh160_digest).digest

        hashed[0, 4] == checksum ? version[0] : nil
      end

      def self.b58_decode(value, length)
        long_value = 0
        result = ''

        value.reverse.each_char.with_index do |c, index|
          long_value += B58_CHARS.index(c) * (B58_BASE**index)
        end

        while long_value >= 256
          long_value, mod = long_value.divmod 256
          result = mod.chr + result
        end

        result = long_value.chr + result

        if result.length < length
          result = 0.chr * (length - result.length) + result
        end

        result
      end
    end
  end
end
