module WaffleAPI
  # Balances object give access to all balances from Wafflepool
  class Balances
    attr_reader :sent, :confirmed, :unconverted, :expected

    def initialize(sent: 0.0, confirmed: 0.0, unconverted: 0.0)
      @sent        = sent
      @confirmed   = confirmed
      @unconverted = unconverted
      @expected    = @confirmed + @unconverted
    end
  end
end
