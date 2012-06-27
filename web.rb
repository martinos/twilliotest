require "rubygems"
require "bundler/setup"

require 'sinatra'

post '/' do
  request.body.read
end

get '/' do
  puts "Hello world"
end
