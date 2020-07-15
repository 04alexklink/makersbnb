describe 'authentication' do
  
  it 'It returns true if the email and password match' do
    User.create(email: 'mobtheworld@mob.com', password: 'hello1')
    result = User.authenticate(email: 'mobtheworld@mob.com', password: 'hello1')
    expect(result).to be true
  end

end