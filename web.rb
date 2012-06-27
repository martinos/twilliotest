require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'

post '/' do
  builder do |xml|
    xml.instruct!
    xml.Response do |xml|
      xml.Say "This is a test" 
    end
  end
end

get '/' do
  puts "Hello world"
end
