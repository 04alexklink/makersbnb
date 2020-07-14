require 'sinatra/base'
require './lib/user'

class Mob_Boss < Sinatra::Base
  # enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    User.create(email: params[:email_sign_up], password: params[:password_sign_up])
    redirect '/signup'
  end

  get '/signup' do
    erb :signup
  end

  run! if app_file == $0
end
