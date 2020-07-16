# frozen_string_literal: true

feature 'viewing a space' do
  scenario 'A user is able to view spaces' do
    successful_login
    click_button('See Spaces')
    expect(page).to have_content('Hello this is a lovely space')
  end
end
