feature 'logging in' do
  scenario ' A user is able to visit the login page' do
    visit ('/')
    fill_in('email_sign_up', with: 'mobtheworld@mob.com')
    fill_in('password_sign_up', with: 'hello1')
    click_button('Sign Up')
    visit ('/')
    click_button('Login')
    fill_in('email_log_in', with: 'mobtheworld@mob.com')
    fill_in('password_log_in', with: 'hello1')
    click_button('Log-in')
    expect(page).to have_content("Welcome to mobbnb!!")
  end
  scenario ' A user is able to visit the login page' do
    visit ('/')
    click_button('Login')
    fill_in('email_log_in', with: 'notanemail.com')
    fill_in('password_log_in', with: 'wronggg')
    click_button('Log-in')
    expect(page).to have_content("Sorry, your details are incorrect!")
    expect(page).to have_button("Back to log-in")
  end
end