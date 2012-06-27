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
    r.Say 'hello there', :voice => 'woman'
#    r.Dial :callerId => '+15147560096' do |d|
#      d.Client 'jenny'
#    end
  end
end

get '/' do
  puts "Hello world"
end
