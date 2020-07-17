# frozen_string_literal: true

require './spec/web_helper'

# This class controls the spaces added and listed on the website.
class Space
  attr_reader :space_name, :space_address, :space_price, :space_description, :user_id

  def initialize(space_name:, space_address:, space_price:, space_description:)
    @space_name, @space_address = space_name, space_address
    @space_price, @space_description = space_price, space_description
    @user_id = "unknown"
  end

  def self.list_a_space(space_name:, space_address:, space_description:, space_price:, user_id:)
    connection = test_connection_check

    user_id = User.user_id
    p user_id
    connection.exec("INSERT INTO spaces (space_name, space_address, space_description, space_price, user_id) VALUES('#{space_name}', '#{space_address}', '#{space_description}', '#{space_price}', #{user_id})")
  end

  def self.all
    connection = test_connection_check

    result = connection.exec('SELECT * FROM spaces')
    result.map do |space|
      Space.new(space_name: space['space_name'], space_address: space['space_address'], space_description: space['space_description'], space_price: space['space_price'])
    end
  end

  def self.user_id
    @user_id
  end

  def self.user
    connection = test_connection_check

    @user_email = connection.exec("SELECT email FROM users WHERE id = #{@user_id}")

  end

  def self.user_email
    @user_email
  end


end
