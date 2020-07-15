require './lib/user'

describe User do

  describe 'authenticate' do

    it 'authenticates the login' do
      User.create(email: "mobemail@email.com", password: "john1")
      result = User.authenticate(email: "mobemail@email.com", password: "john1")
      expect(result).to be true
    end

    it 'returns false if the user is not in the database' do
      result = User.authenticate(email: "mobemail@email.com", password: "john1")
      expect(result).to be false
    end

    it 'returns false if the password does not match the email' do
      User.create(email: "mobemail@email.com", password: "john1")
      result = User.authenticate(email: "mobemail@email.com", password: "alan1")
      expect(result).to be false
    end
  end
end
