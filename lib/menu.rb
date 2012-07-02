require 'sinatra'

class Menu < Sinatra::Base
  def initialize(app, name)
    @name = name
    get '/coco' do
      "coco" 
    end
    super(app)
  end
end
