# encoding: utf-8
require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'
require 'yaml'

$stdout.sync = true

post '/' do
  builder = Builder::XmlMarkup.new(:indent=>2)
   
  response = builder.Response do |r|
    r.Say 'Bonjour les amis!', :voice => 'woman', :language => 'fr'
    r.Gather :action => "/gather" do |gather|
      gather.Say "Entrez un nombre suivit du dièse.", :voice => 'woman', :language => 'fr'
    end
  end
  puts request.params.to_yaml
  puts response
  response
end

get '/' do
  puts "cocoé"
  "Hello worldé"
end

post '/gather' do
  digits = params[:Digits]
  puts request.params.to_yaml
  builder = Builder::XmlMarkup.new(:indent=>2)
  builder.Response do |r|
    r.Say "Bonjour les amis. Vous avez appuyé sur #{digits}", :voice => 'woman', :language => 'fr'
  end
end
