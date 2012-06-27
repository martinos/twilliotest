require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'
require 'yaml'
$stdout.sync = true
post '/' do
#  builder do |xml|
#    xml.instruct!
#    xml.Response do |xml|
#      xml.Say "Your account is live. Make a call to your Sandbox Number and test our demo Twilio app. Call and, when prompted, enter your pin" 
#    end
#  end
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Bonjour les amis!', :voice => 'woman', :language => 'fr'
    r.Gather :action => "/gather" do |gather|
      gather.Say "Entrez un nombre.", :voice => 'woman', :language => 'fr'
    end
  end
  text = request.params.to_yaml
  puts text
  response.text
end

get '/' do
  puts "coco"
  "Hello world"
end

post '/gather' do
  response = Twilio::TwiML::Response.new do |r|
    r.Say "Bonjour les amis. Vous avez appuye sur #{params[:Digits]}", :voice => 'woman', :language => 'fr'
  end.text
end
