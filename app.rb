# frozen_string_literal: true

require 'sinatra/base'
require './lib/user'
require './lib/space'

# This is the route class.
class MobBoss < Sinatra::Base
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
    # User.authenticate(email: params[:email_log_in], password: params[:password_log_in])
    redirect '/logincheck'
  end

  get '/logincheck' do
    @result = User.authenticate(email: session[:email_log_in], password: session[:password_log_in])
    if @result == true
      User.set_id_of_user
    end
    erb :logincheck
  end

  get '/view_spaces' do
    @spaces = Space.all
    erb :view_spaces
  end

  get '/list_spaces' do
    erb :list_spaces
  end

  post '/list_spaces' do
    Space.list_a_space(space_name: params[:space_name], space_address: params[:space_address], space_description: params[:space_description], space_price: params[:space_price])
    redirect '/view_spaces'
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
