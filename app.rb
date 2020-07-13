require 'sinatra/base'
require './lib/mobbnb'

class Mob_Boss < Sinatra::Base

  get '/' do
    erb :index
  end

  run! if app_file == $0
end