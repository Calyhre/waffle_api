FactoryGirl.define do
  factory :worker, class: WaffleAPI::Worker do
    name       { Faker::Bitcoin.address }
    hash_rate  { Faker::Number.number(7).to_i }
    stale_rate { Faker::Number.decimal(1).to_f }
    last_seen  { Time.now.to_i }

    initialize_with { new(attributes) }
  end

  factory :payment, class: WaffleAPI::Payment do
    amount           { Faker::Number.decimal(0, 6).to_f }
    paid_at          { Time.now.to_s }
    transaction_hash { Faker::Lorem.characters(64) }

    initialize_with { new(attributes) }
  end

  factory :balances, class: WaffleAPI::Balances do
    sent        { Faker::Number.decimal(1, 6).to_f }
    confirmed   { Faker::Number.decimal(0, 6).to_f }
    unconverted { Faker::Number.decimal(0, 6).to_f }

    initialize_with { new(attributes) }
  end
end
