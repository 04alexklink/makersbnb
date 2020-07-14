require 'pg'

class User
  attr_reader :email, :password

  def initialize
    @email = ""
    @password = ""
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'mobbnb_test')
    else
      connection = PG.connect(dbname: 'mobbnb')
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email, password")

  end

end
