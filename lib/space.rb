# frozen_string_literal: true

require './spec/web_helper'

# This class controls the spaces added and listed on the website.
class Space
  attr_reader :space_name, :space_address, :space_price, :space_description

  def initialize(space_name:, space_address:, space_price:, space_description:)
    @space_name, @space_address = space_name, space_address
    @space_price, @space_description = space_price, space_description
  end

  def self.list_a_space(space_name:, space_address:, space_description:, space_price:)
    connection = test_connection_check

    connection.exec("INSERT INTO spaces (space_name, space_address, space_description, space_price) VALUES('#{space_name}', '#{space_address}', '#{space_description}', '#{space_price}')")
  end

  def self.all
    connection = test_connection_check

    result = connection.exec('SELECT * FROM spaces')
    result.map do |space|
      Space.new(space_name: space['space_name'], space_address: space['space_address'], space_description: space['space_description'], space_price: space['space_price'])
    end
  end
end
