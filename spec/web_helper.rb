# frozen_string_literal: true

def successful_login
  visit '/'
  fill_in('email_sign_up', with: 'mobtheworld@mob.com')
  fill_in('password_sign_up', with: 'hello1')
  click_button('Sign Up')
  visit '/'
  click_button('Login')
  fill_in('email_log_in', with: 'mobtheworld@mob.com')
  fill_in('password_log_in', with: 'hello1')
  click_button('Log-in')
end

def successful_sign_up
  visit '/'
  fill_in('email_sign_up', with: 'mobtheworld@mob.com')
  fill_in('password_sign_up', with: 'hello1')
  click_button('Sign Up')
end

def add_test_space
  click_button('List a Space')
  fill_in('space_name', with: 'Heavenly House')
  fill_in('space_address', with: '666 Heavenly Street')
  click_button('Add')
end

def test_connection_check
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'mobbnb_test')
  else
    PG.connect(dbname: 'mobbnb')
  end
end