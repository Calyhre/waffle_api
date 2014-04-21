module WaffleAPI
  # Payment object give access to recent payments from Wafflepool. It give
  # access to amount, paid_at and transaction_hash
  class Payment
    attr_reader :amount, :paid_at, :transaction_hash

    def initialize(amount: 0.0, paid_at: Time.now.to_s, transaction_hash: '')
      @amount = amount
      @paid_at = DateTime.parse(paid_at).to_time
      @transaction_hash = transaction_hash
    end
  end
end
