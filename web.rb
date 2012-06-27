# encoding: utf-8
require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'
require 'yaml'

$stdout.sync = true

post '/' do
  puts "POST OSTIE"
  response = Builder::XmlMarkup.new(:indent=>2)
   
  response.Response do |r|
    r.Say 'Bonjour les amis!', :voice => 'woman', :language => 'fr'
    r.Gather :action => "/gather" do |gather|
      gather.Say "Entrez un nombre suivit du dièse.", :voice => 'woman', :language => 'fr'
    end
  end
  puts request.params.to_yaml
  puts xml = response.to_s
  xml
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
    r.Say "Bonjour les amis. Vous avez appuyez sur #{digits}", :voice => 'woman', :language => 'fr'
  end.to_s
end
