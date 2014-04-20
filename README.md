# WaffleAPI

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
require 'waffle_pool'
client = WaffleAPI::Client.new address: '1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V'
```


### Get current total hashrate
```ruby
client.hashrate
```


### Get workers infos

```ruby
client.worker_hashrates
```

Will return a JSON array

```json
[
  {
    "username": "1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V_calyhrerig1",
    "hashrate": 2529705,
    "stalerate": 3.33,
    "last_seen": 1398022030,
    "str": "2.53 MH/s"
  },
  {
    "username": "1Ju8U9Ukfc5kiMqzQrRgQBP1JvRkeSv94V_dqmsrig1",
    "hashrate": 1773702,
    "stalerate": 1.61,
    "last_seen": 1398022030,
    "str": "1.77 MH/s"
  }
]
```


### Get balances

```ruby
client.balances
```

Will return a JSON array

```json
{
  "sent": 1.61039009,
  "confirmed": 0.00383488,
  "unconverted": 0.011964213459441
}
```


### Get payments

```ruby
client.recent_payments
```

Will return a JSON array containing the last 10 payments

```json
[
  {
    "amount": "0.01715311",
    "time": "2014-04-20 16:03:24",
    "txn": "8706e0a..."
  },
  {
    "amount": "0.01600557",
    "time": "2014-04-20 04:36:01",
    "txn": "258dda8..."
  },
  {
    "..."
  }
]
```


## Contributing

[Contributors](https://github.com/Calyhre/waffle_api/graphs/contributors) and [CONTRIBUTING](https://github.com/Calyhre/waffle_api/blob/master/CONTRIBUTING.md)

## Licence

Released under the MIT License. See the [LICENSE](https://github.com/Calyhre/waffle_api/blob/master/LICENSE.md) file for further details.

[travis_img]: https://travis-ci.org/Calyhre/waffle_api.png?branch=master
[travis_url]: https://travis-ci.org/Calyhre/waffle_api
[fury_img]: https://badge.fury.io/rb/waffle_api.png
[fury_url]: http://badge.fury.io/rb/waffle_api
[code_climate_img]: https://codeclimate.com/github/Calyhre/waffle_api.png
[code_climate_url]: https://codeclimate.com/github/Calyhre/waffle_api
[coveralls_img]: https://coveralls.io/repos/Calyhre/waffle_api/badge.png?branch=master
[coveralls_url]: https://coveralls.io/r/Calyhre/waffle_api?branch=master
