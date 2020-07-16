# frozen_string_literal: true

require 'pg'
require './spec/web_helper'

# This class creates, controls and authenticates new and existing users.
class User
  attr_reader :email, :password

  def initialize(email:, password:)
    @email, @password = email, password
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
end
