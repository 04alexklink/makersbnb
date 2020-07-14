require 'sinatra/base'
require './lib/user'

class Mob_Boss < Sinatra::Base
  # enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    user = User.new
    user.add_email(email: params[:email_sign_up])
    user.add_password(password: params[:password_sign_up])
    erb :signup
  end


  run! if app_file == $0
end
