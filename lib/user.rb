# frozen_string_literal: true

require 'pg'
require './spec/web_helper'

# This class creates, controls and authenticates new and existing users.
class User
  attr_reader :email, :password, :user_id

  def initialize(email:, password:)
    @email, @password = email, password
    @user_id = 
  end

  def self.create(email:, password:)
    connection = test_connection_check

    connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}')")
  end

  def self.authenticate(email:, password:)
    @email, @password = email, password

    connection = test_connection_check

    result = connection.query("SELECT password FROM users WHERE email = '#{@email}'")
    return false unless result.any?

    result[0]['password'] == @password
  end

  def self.set_id_of_user
    connection = test_connection_check
    set_id = connection.query("SELECT id FROM users WHERE email = '#{@email}'")
    p set_id[0]['id'].to_i
    @user_id = set_id[0]['id'].to_i
  end
end
