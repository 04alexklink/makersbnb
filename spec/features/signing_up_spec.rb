feature 'sign-up' do
  scenario ' A user is able to input email and password' do
    visit ('/')
    fill_in('email_sign_up', with: 'mobtheworld@mob.com')
    fill_in('password_sign_up', with: 'hello1')
    click_button('Sign Up')
    expect(page).to have_content("Congratulations! You are part of the mob!")
  end
end