require 'resque'

ENV["REDISTOGO_URL"] ||= "redis://redistogo:fdc70ed5f0065a923544eecc619fb78e@icefish.redistogo.com:9332/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)