# frozen_string_literal: true

feature 'viewing a space' do
  scenario 'A user is able to view spaces' do
    successful_login
    add_test_space
    expect(page).to have_content 'Hello this is a lovely space'
    expect(page).to have_content 'Heavenly House'
    expect(page).to have_content '666 Heavenly Street'
  end
end
