describe 'authentication' do
  
  it 'It returns true if the email and password match' do
    user = User.create(email: 'mobtheworld@mob.com', password: 'hello1')
    user2 = User.new(email: 'mobtheworld@mob.com', password: 'hello1')
    #user2.authenticate
    expect(user2.authenticate).to be(true)
  end

end