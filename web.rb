require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'

post '/' do
  builder do |xml|
    xml.instruct!
    xml.Response do |xml|
      xml.Say "Your account is live. Make a call to your Sandbox Number and test our demo Twilio app. Call and, when prompted, enter your pin" 
    end
  end
end

get '/' do
  puts "Hello world"
end
