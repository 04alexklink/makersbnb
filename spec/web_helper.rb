
def successful_login
    visit ('/')
    fill_in('email_sign_up', with: 'mobtheworld@mob.com')
    fill_in('password_sign_up', with: 'hello1')
    click_button('Sign Up')
    visit ('/')
    click_button('Login')
    fill_in('email_log_in', with: 'mobtheworld@mob.com')
    fill_in('password_log_in', with: 'hello1')
    click_button('Log-in')

end

def successful_sign_up 
    visit ('/')
    fill_in('email_sign_up', with: 'mobtheworld@mob.com')
    fill_in('password_sign_up', with: 'hello1')
    click_button('Sign Up')
end