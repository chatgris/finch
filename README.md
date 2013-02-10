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
  declarator.ping "Admin", host: "localhost", port: 3000, group: "Apps"
  declarator.ping "Front", host: "localhost", port: 3000, group: "Apps"
  declarator.ping "Public Api", host: "localhost", port: 3200, group: "Api"
  declarator.ping "Private Api", host: "localhost", port: 3300, group: "Api"
  declarator.ping "Redis", host: "localhost", port: 6379, group: "DB"
  declarator.ping "Mongo", host: "localhost", port: 27017, group: "DB"
  declarator.ping "ElasticSearch", host: "localhost", port: 9200, group: "DB"
  declarator.ping "Beanstalkd", host: "localhost", port: 11300, group: "Messaging"
  declarator.ping "Finch", host: "localhost", port: 9292
end

run Finch::App
```

And run `rackup`, and you're done.


## Copyright

MIT. See LICENSE for further details.
