require 'pg'

class User
  attr_reader :email, :password

  def initialize
    @email = ""
    @password = ""
  end

  def self.create(email:, password:)
    connection = PG.connect(dbname: 'mobbnb')

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email, password")

  end

end
