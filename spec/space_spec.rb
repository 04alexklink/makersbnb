# frozen_string_literal: true

require './lib/space.rb'

describe Space do
  describe 'all' do
    it 'returns all spaces' do
      Space.list_a_space(space_name: 'Heavenly House', space_address: '666 Heavenly Street', space_description: 'No one has cleaned for ten years', space_price: '305')
      PG.connect(dbname: 'mobbnb_test')
      spaces = Space.all
      expect(spaces.first.space_name).to eq 'Heavenly House'
      expect(spaces.first.space_address).to eq '666 Heavenly Street'
    end
  end

end
