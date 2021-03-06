# encoding: utf-8

require "rubygems"
require "bundler/setup"

require 'sinatra'
require 'twilio-ruby'
require 'yaml'
require 'logger'
require './lib/menu'

#require './logging_info'

class TwilioTest < Sinatra::Base
  use Menu, "PPPPPPPPPPPPPP"
  
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
        gather.Say "Si vous voulez l'heure locale appuyez sur 1.", female
        gather.Say "Si vous voulez l'heure universelle appuyez sur 2. ", female
      end
    end
    response
  end

  post '/main_menu_selection' do
    digits = params[:Digits]

    builder = Builder::XmlMarkup.new(:indent => 2)
    male = {:voice => 'man', :language => 'fr'} 
    response = builder.Response do |r|
      now = Time.now
      case digits.chars.first
      when '1'
         r.Say "Il est #{now.hour} heures #{now.min}", male
      when '2'
        r.Say "Il est #{now.utc.hour} heures #{now.utc.min}", male
      else
        r.Say "Choix invalide.", :language => 'fr'
      end
    end
    puts response
  
    response
  end
end
