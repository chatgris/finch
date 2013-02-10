# encoding: utf-8
require 'celluloid'
require 'net/ping/tcp'
require "sinatra/base"
require "slim"

module Finch
  class App < Sinatra::Base
    helpers do
      def class_for_status(state)
        state == :ok ? "success" : "error"
      end
    end
    get "/" do
      slim :ping, locals: {pings: settings.declarator_ids.map do |id|
        Celluloid::Actor[id]
      end
      }
    end
  end

  class Pinger
    include Celluloid
    attr_reader   :timer, :host, :port, :group
    attr_accessor :last_success, :state, :name

    def initialize(opts = {})
      @name = opts.fetch(:name, "Unkown")
      @host = opts.fetch(:host, "localhost")
      @group = opts.fetch(:group, "Default")
      @port = opts[:port]
      @timer  = every(opts.fetch(:frequency, 30)) { ping }
      ping
    end

    def ping
      ping_accessor.ping ? success : error
    end

    private

    def success
      self.state = :ok
      self.last_success = Time.now.utc
    end

    def error
      self.state = :ko
    end

    def ping_accessor
      @ping_accessor ||= Net::Ping::TCP.new(host, port)
    end
  end

  class Declator
    attr_reader :ids

    def initialize
      @ids = []
    end

    def ping(opts)
      ids << id = opts.delete(:id)
      Pinger.supervise_as(id, opts)
    end
  end

  def declare
    yield declarator = Declator.new
    App.set :declarator_ids, declarator.ids
  end

  module_function :declare
end
