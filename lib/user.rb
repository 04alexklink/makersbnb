require 'pg'

class User
  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'mobbnb_test')
    else
      connection = PG.connect(dbname: 'mobbnb')
    end
    connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}')")
  end

  def self.authenticate(email:, password:)
    @email = email
    @password = password
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'mobbnb_test')
    else
      connection = PG.connect(dbname: 'mobbnb')
    end

    result = connection.query("SELECT password FROM users WHERE email = '#{@email}'")
    return false unless result.any?

    if result[0]['password'] == @password
      return true
    else
      return false
    end

  end

  # def self.list_a_space(space_name:, space_address:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'mobbnb_test')
  #   else
  #     connection = PG.connect(dbname: 'mobbnb')
  #   end
  #
  #   connection.exec("INSERT INTO spaces (space_name, space_address) VALUES('#{space_name}', '#{space_address}')")
  #
  # end

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
