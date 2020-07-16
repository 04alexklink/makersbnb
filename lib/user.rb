# frozen_string_literal: true

require 'pg'

# This class creates, controls and authenticates new and existing users.
class User
  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'mobbnb_test')
                 else
                   PG.connect(dbname: 'mobbnb')
                 end
    connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}')")
  end

  def self.authenticate(email:, password:)
    @email = email
    @password = password
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'mobbnb_test')
                 else
                   PG.connect(dbname: 'mobbnb')
                 end

    result = connection.query("SELECT password FROM users WHERE email = '#{@email}'")
    return false unless result.any?

    result[0]['password'] == @password
  end

  # def self.all
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'mobbnb_test')
  #   else
  #     connection = PG.connect(dbname: 'mobbnb')
  #   end
  #   result = connection.exec("SELECT * FROM spaces")
  #   result.map do |space|
  #     User.new(space_name: space['space_name'], space_address: space['space_address'])
  #   end
  # end
end
