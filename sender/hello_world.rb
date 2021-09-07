#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "bunny"

STDOUT.sync = true

# Wait until Rabbit-MQ is up
# TODO: Wait for start message via Rabbit-MQ
sleep 15

conn = Bunny.new(host: ENV["RABBITMQ_HOST"])
conn.start

ch = conn.create_channel
q  = ch.queue("bunny.examples.hello_world", :auto_delete => true)
x  = ch.default_exchange

q.subscribe do |delivery_info, metadata, payload|
    puts "Received #{payload}"
end

x.publish("Hello!", :routing_key => q.name)

sleep 60000
conn.close
