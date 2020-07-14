require 'sinatra/base'
require './lib/mobbnb'

class Mob_Boss < Sinatra::Base
  # enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    Mobbnb.add_email(email: params[:email_sign_up])
    Mobbnb.add_password(password: params[:password_sign_up])
    erb :signup
    p Mobbnb.email
  end


  run! if app_file == $0
end
