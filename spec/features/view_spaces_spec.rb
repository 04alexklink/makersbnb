# frozen_string_literal: true

feature 'viewing a space' do
  scenario 'A user is able to view spaces' do
    successful_login
    add_test_space
    expect(page).to have_content 'Hello this is a lovely space'
    expect(page).to have_content 'Heavenly House'
    expect(page).to have_content '666 Heavenly Street'
    expect(page).to have_content 'mobtheworld@mob.com'
  end

  scenario 'Another use is able to view their specific spaces' do
    visit '/'
    fill_in('email_sign_up', with: 'anotheruser@gmail.com')
    fill_in('password_sign_up', with: 'hello1')
    click_button('Sign Up')
    visit '/'
    click_button('Login')
    fill_in('email_log_in', with: 'anotheruser@gmail.com')
    fill_in('password_log_in', with: 'hello1')
    click_button('Log-in')
    add_test_space
    expect(page).to have_content 'anotheruser@gmail.com'
  end
end
