feature 'viewing a space' do
  scenario 'A user is able to view spaces' do
    visit ('/')
    fill_in('email_sign_up', with: 'mobtheworld@mob.com')
    fill_in('password_sign_up', with: 'hello1')
    click_button('Sign Up')
    visit ('/')
    click_button('Login')
    fill_in('email_log_in', with: 'mobtheworld@mob.com')
    fill_in('password_log_in', with: 'hello1')
    click_button('Log-in')
    click_button('See Spaces')
    expect(page).to have_content("hello this is a lovely space")
  end
end
