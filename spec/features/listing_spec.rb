# frozen_string_literal: true

feature 'listing a space' do
  scenario 'the user can list a space' do
    successful_login
    click_button('List a Space')
    fill_in('space_name', with: 'Heavenly House')
    fill_in('space_address', with: '666 Heavenly Street')
    fill_in('space_description', with: 'No one has cleaned for ten years')
    fill_in('space_price', with: '305')
    click_button('Add')
    expect(page).to have_content('Heavenly House')
    expect(page).to have_content('666 Heavenly Street')
    expect(page).to have_content('No one has cleaned for ten years')
    expect(page).to have_content('305')
  end
end
