class Mobbnb
  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.add_email(email)
    @email = email
  end

  def self.add_password(password)
    @password = password
  end

end
