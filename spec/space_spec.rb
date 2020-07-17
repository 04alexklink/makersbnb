# frozen_string_literal: true

require './lib/space.rb'

describe Space do
  describe 'all' do
    it 'returns all spaces' do
      Space.list_a_space(space_name: 'Heavenly House', space_address: '666 Heavenly Street', space_description: 'No one has cleaned for ten years', space_price: '305', user_id: User.user_id)
      PG.connect(dbname: 'mobbnb_test')
      spaces = Space.all
      expect(spaces.first.space_name).to eq 'Heavenly House'
      expect(spaces.first.space_address).to eq '666 Heavenly Street'
    end
  end

  # describe 'get user id' do
  #   it 'return the user id from the database' do
  #     Space.list_a_space(space_name: 'Heavenly House', space_address: '666 Heavenly Street', space_description: 'No one has cleaned for ten years', space_price: '305', user_id: User.user_id)
  #     my_id = Space.user_id
  #     p my_id
  #     expect(my_id).to be_integer
  #
  #   end
  # end

end
