# finch

finch is a barebone monitoring dashboard.

## Installation

Ruby 1.9.2 is required.

Install it with rubygems:

``` shell
gem install finch
```

With bundler, add it to your `Gemfile`:

``` ruby
gem "finch"
```

## Usage

Configure a `config.ru` file:

``` ruby
require "finch"

Finch.declare do |declarator|
  declarator.ping name: "Redis", host: "localhost", port: 6379, id: "redis"
  declarator.ping name: "Mongo", host: "localhost", port: 27017, id: "mongo"
  declarator.ping name: "ElasticSearch", host: "localhost", port: 9200, id: "es"
end

run Finch::App
```

And run `rackup`, and you're done.


## Copyright

MIT. See LICENSE for further details.
