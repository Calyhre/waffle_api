module WaffleAPI
  # Worker object give access to it's hashrate, stalerate, etc...
  class Worker
    attr_reader :name, :hash_rate, :stale_rate, :last_seen

    def initialize(name: '', hash_rate: 0, stale_rate: 0.0, last_seen: 0)
      @name = name.split('_', 2).last
      @name = name if @name.nil? || @name.empty?
      @hash_rate = hash_rate
      @stale_rate = stale_rate
      @last_seen = Time.at(last_seen)
    end
  end
end
