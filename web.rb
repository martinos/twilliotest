require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'
require 'yaml'

$stdout.sync = true
post '/' do
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Bonjour les amis!', :voice => 'woman', :language => 'fr'
    r.Gather :action => "/gather" do |gather|
      gather.Say "Entrez un nombre suivit du diese.", :voice => 'woman', :language => 'fr'
    end
  end
  puts request.params.to_yaml
  puts xml = response.text
  xml
end

get '/' do
  puts "coco"
  "Hello world"
end

post '/gather' do
  puts request.params.to_yaml
  response = Twilio::TwiML::Response.new do |r|
    r.Say "Bonjour les amis. Vous avez appuye sur #{params[:Digits]}", :voice => 'woman', :language => 'fr'
  end.text
end
