module WaffleAPI
  # WaffleAPI raised errors with explanations
  module Error
    ISSUES_URL = 'https://github.com/Calyhre/waffle_api/issues/new'

    # Standard error we will inherit
    class Standard < StandardError
      def initialize(message = nil)
        super(message || self.message)
      end
    end

    # Error raised when address is missing
    class EmptyAddress < Standard
      def message
        "You must provide an address to use this API. Please check the " \
        "documentation."
      end
    end

    # Error raised when address isn't valid
    class BadAddress < Standard
      def initialize(address = '')
        super message address
      end

      def message(address = '')
        "Address '#{address}' doesn't seem to be valid. You must provide a " \
        "valid address to use this API. Use ignore_bad_address to skip this " \
        "error."
      end
    end

    # Error raised when Waffle change his API endpoint. Nothing to do but
    # report an issue on this gem repo
    class EndPointMoved < Standard
      def message
        "Waffle pool seems to have change his API endpoint. Please report " \
        "an issue on #{ISSUES_URL}."
      end
    end

    # Error raised when Waffle change his API endpoint. Nothing to do but
    # report an issue on this gem repo
    class AddressNotFound < Standard
      def initialize(address = '')
        super message address
      end

      def message(address = '')
        "The address #{address} was not found on Wafflepool. Please check it."
      end
    end

    # If you raise this exception, please report it as an issue with the
    # message on this gem repo
    class UnknownError < Standard; end

    # If you raise this exception, please report it as an issue with it's
    # message on this gem repo
    class UnknownKey < Standard
      def initialize(key = '')
        super message key
      end

      def message(key = '')
        "The key '#{key}' does not exist on Wafflepool api."
      end
    end
  end
end
