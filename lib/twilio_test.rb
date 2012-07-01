# encoding: utf-8

require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'builder'
require 'twilio-ruby'
require 'yaml'
require 'logger'

#require './logging_info'

class TwilioTest < Sinatra::Base
  def logger
    request.logger
  end

  get '/' do
    logger.info("This is a test")
    "This is a test"
  end

  post '/call' do
    builder = Builder::XmlMarkup.new(:indent=>2)
     
    response = builder.Response do |r|
      female = {:voice => 'woman', :language => 'fr'} 
      r.Say 'Bonjour les amis!', female
      r.Gather :action => "/main_menu_selection", :numDigits => 1  do |gather|
        gather.Say "Si vous êtes Stéphane Hamel appuyez sur 1.", female
        gather.Say "Si vous êtes Étienne Savard sur 2. ", female
      end
    end
    response
  end

  post '/main_menu_selection' do
    digits = params[:Digits]

    builder = Builder::XmlMarkup.new(:indent => 2)
    male = {:voice => 'man', :language => 'fr'} 
    response = builder.Response do |r|
      case digits.chars.first
      when '1'
        r.Say "Salut Stéphane, je suis en train de faire un test avec Twilio, l'API est plutôt facile à utiliser et cette application roule sur Héroku", male
  #      r.Say "Tu as appelé du numéro de téléphone suivant: #{params[:Caller].chars.to_a.join(' ')}", :language => 'fr'
      when '2'
        r.Say "Salut Étienne, je suis en train de faire un test avec Twilio, l'API est plutôt facile à utiliser et cette application roule sur Héroku", male
      else
        r.Say "Choix invalide.", :language => 'fr'
      end
    end
    response
  end
end
