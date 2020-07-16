# frozen_string_literal: true

feature 'sign-up' do
  scenario ' A user is able to input email and password' do
    successful_sign_up
    expect(page).to have_content('Congratulations! You are part of the mob!')
  end
end
