# frozen_string_literal: true

require './lib/user'

describe User do
  describe 'authenticate' do
    it 'authenticates the login' do
      User.create(email: 'mobemail@email.com', password: 'john1')
      result = User.authenticate(email: 'mobemail@email.com', password: 'john1')
      expect(result).to be true
    end

    it 'returns false if the user is not in the database' do
      result = User.authenticate(email: 'mobemail@email.com', password: 'john1')
      expect(result).to be false
    end

    it 'returns false if the password does not match the email' do
      User.create(email: 'mobemail@email.com', password: 'john1')
      result = User.authenticate(email: 'mobemail@email.com', password: 'alan1')
      expect(result).to be false
    end
  end

  describe 'initialize' do
    it 'adds the emails, ID and passwords to the variables' do
      user = User.new(email: 'mobemail@email.com', password: 'john1')
      expect(user.email).to eq 'mobemail@email.com'
      expect(user.password).to eq 'john1'
    end
  end

  describe 'set id of user' do
    it 'sets user id from id in the database' do
      User.create(email: 'mobemail@email.com', password: 'john1')
      User.authenticate(email: 'mobemail@email.com', password: 'john1')
      User.set_id_of_user
      expect(User.user_id).to be_integer
    end
  end
end
