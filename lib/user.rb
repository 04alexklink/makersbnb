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

end
