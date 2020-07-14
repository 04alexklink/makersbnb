require 'pg'

class User
  attr_reader :email, :password

  def initialize
    @email = ""
    @password = ""
  end

  def add_email(email)
    @email = email
  end

  def add_password(password)
    @password = password
  end

  def self.all
    connection = PG.connect(dbname: 'mobbnb')

    result = connection.exec('SELECT * FROM users')
    result.map do |user|
      User.new(id: user['id'], email: user['email'], password: user['password'])
    end
  end

  def self.create(email:, password:)
    connection = PG.connect(dbname: 'mobbnb')

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email, password")
    User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
  end

end
