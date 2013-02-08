# encoding: utf-8
require File.expand_path "../../lib/finch", __FILE__

Finch.declare do |declarator|
  declarator.ping name: "Redis", host: "localhost", port: 6379, id: "redis"
  declarator.ping name: "Mongo", host: "localhost", port: 27017, id: "mongo"
  declarator.ping name: "ElasticSearch", host: "localhost", port: 9200, id: "es"
end

run Finch::App
