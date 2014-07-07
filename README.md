# WaffleAPI

[![Codeship Status][codeship_img]][codeship_url]

[![Build Status][travis_img]][travis_url]
[![Gem Version][fury_img]][fury_url]
[![Code Climate][code_climate_img]][code_climate_url]
[![Coverage Status][coveralls_img]][coveralls_url]

_Waffle pool API gem_

## Installation

### Ruby 2+

```ruby
gem install waffle_api
```

## Usage

```ruby
require 'waffle_api'
client = WaffleAPI::Client.new address: '1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V'
```


### WaffleAPI::Client
```ruby
# Hash rate in H/s
client.hashrate
#=> 1_234_567

# List of all workers
workers = client.workers
#=> [ #<WaffleAPI::Worker>, #<WaffleAPI::Worker>, ... ]

# Current balances
balances = client.balances
#=> #<WaffleAPI::Balances>

# 10 last recent payments
payments = client.payments
#=> [ #<WaffleAPI::Payment>, #<WaffleAPI::Payment>, ... ]
```

### WaffleAPI::Worker
```ruby
worker = workers.first
#=> #<WaffleAPI::Worker>

# Worker name, without an underscore in it
worker.name
#=> 1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V

# Worker name, with an underscore in it e.g: 1Ju8U...94V_worker0
worker.name
#=> worker0

# Hash rate in H/s
worker.hash_rate
#=> 723_456

# Stale rate in %
worker.stale_rate
#=> 3.6

# Last seen
worker.last_seen
#=> 2014-03-13 20:22:42 +0100
```

### WaffleAPI::Balances
```ruby
# BTC already paid
balances.sent
#=> 1.623456

# BTC confirmed but not yet paid
balances.confirmed
#=> 0.012345

# BTC not yet converted (approximate)
balances.unconverted
#=> 0.012345

# Expected BTC (confirmed + unconverted, approximate)
balances.expected
#=> 0.02469
```

### WaffleAPI::Payment
```ruby
payment = payments.first
#=> #<WaffleAPI::Payment>

# Payment amount
payment.amount
#=> 0.02469

# Payment paid date
payment.paid_at
#=> 2014-03-13 20:22:42 +0100

# Payment transaction hash
payment.transaction_hash
#=> "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b"
```


## Contributing

[Contributors](https://github.com/Calyhre/waffle_api/graphs/contributors) and [CONTRIBUTING](https://github.com/Calyhre/waffle_api/blob/master/CONTRIBUTING.md)

## Licence

Released under the MIT License. See the [LICENSE](https://github.com/Calyhre/waffle_api/blob/master/LICENSE.md) file for further details.

[codeship_img]: https://www.codeship.io/projects/9f1058f0-e803-0131-219c-66a2774f0218/status
[codeship_url]: https://www.codeship.io/projects/25980
[travis_img]: https://travis-ci.org/Calyhre/waffle_api.svg?branch=master
[travis_url]: https://travis-ci.org/Calyhre/waffle_api
[fury_img]: https://badge.fury.io/rb/waffle_api.svg
[fury_url]: http://badge.fury.io/rb/waffle_api
[code_climate_img]: https://codeclimate.com/github/Calyhre/waffle_api.png
[code_climate_url]: https://codeclimate.com/github/Calyhre/waffle_api
[coveralls_img]: https://coveralls.io/repos/Calyhre/waffle_api/badge.png?branch=master
[coveralls_url]: https://coveralls.io/r/Calyhre/waffle_api?branch=master
