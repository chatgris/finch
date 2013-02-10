# finch

finch is a barebone monitoring dashboard.

![finch](https://raw.github.com/chatgris/finch/master/example/finch.jpg)

I was looking for a dashboard that could be used to monitor HTTP apps, databases
and messaging services. It wanted it to be easy to use and without any
dependencies.

The search of such a board was starting to take longer than the time required to
create one. Basically.

## Installation

Ruby 1.9.2 (or superior) is required.

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
  declarator.ping "Front", host: "localhost", port: 3001, group: "Apps"
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
