require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'

post '/' do
#  builder do |xml|
#    xml.instruct!
#    xml.Response do |xml|
#      xml.Say "Your account is live. Make a call to your Sandbox Number and test our demo Twilio app. Call and, when prompted, enter your pin" 
#    end
#  end
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Bonjour les amis', :voice => 'woman', :language => 'fr'
  end
  response.text
end

get '/' do
  puts "Hello world"
end
