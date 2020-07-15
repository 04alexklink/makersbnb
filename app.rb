require 'sinatra/base'
require './lib/user'

class Mob_Boss < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/logincheck' do
    session[:email_log_in] = params[:email_log_in]
    session[:password_log_in] = params[:password_log_in]
    p session
  # User.authenticate(params[:email_log_in], params[:password_log_in)
  # NOT GOING TO USE user.authetnicate here, but in get logincheck route
    redirect '/logincheck'
  end

  get '/logincheck' do
   # @result = User.authenticate(session[:email_log_in], session[:password_log_in])
    @result = true
   erb :logincheck

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
