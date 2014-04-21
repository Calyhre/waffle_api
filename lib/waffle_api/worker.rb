module WaffleAPI
  # Worker object give access to it's hashrate, stalerate, etc...
  class Worker
    attr_reader :name, :hash_rate, :stale_rate, :last_seen

    def initialize(name:, hash_rate:, stale_rate:, last_seen:)
      @name = name.split('_')[1..-1].join
      @name = name if @name.empty?
      @hash_rate = hash_rate
      @stale_rate = stale_rate
      @last_seen = Time.at(last_seen)
    end
  end
end
