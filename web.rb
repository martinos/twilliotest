# encoding: utf-8
require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'
require 'yaml'
require './logging_info'
use Rack::CommonLogger
use LoggingInfo

$stdout.sync = true

post '/' do
  builder = Builder::XmlMarkup.new(:indent=>2)
   
  response = builder.Response do |r|
    r.Say 'Bonjour les amis!', :voice => 'woman', :language => 'fr'
    r.Gather :action => "/gather", :numDigits => 1  do |gather|
      gather.Say "Si vous êtes Stéphane Hamel appuyez sur 1.", :voice => 'woman', :language => 'fr'
      gather.Say "Si vous êtes Étienne Savard sur 2.", :language => 'fr'
    end
  end
  response
end

get '/' do
  puts "cocoé"
  "Hello worldé"
end

post '/gather' do
  digits = params[:Digits]

  builder = Builder::XmlMarkup.new(:indent=>2)
  response = builder.Response do |r|
    case digits[0].to_i
    when 1
      r.Say "Salut Stéphane, je suis en train de faire un test avec Twilio, l'API est plutôt facile à utiliser et cette application roule sur Héroku", :language => 'fr'
    when 2
      r.Say "Salut Étienne, je suis en train de faire un test avec Twilio, l'API est plutôt facile à utiliser et cette application roule sur Héroku", :language => 'fr'
    else
      r.Say "Choix invalide"
    end
  end
  response
end
