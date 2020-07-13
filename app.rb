class Mobbnb
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


end