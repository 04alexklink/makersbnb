# frozen_string_literal: true

require './lib/space.rb'

describe Space do
  describe 'all' do
    it 'returns all spaces' do
      Space.list_a_space(space_name: 'Heavenly House', space_address: '666 Heavenly Street')
      PG.connect(dbname: 'mobbnb_test')
      spaces = Space.all
      expect(spaces.first.space_name).to eq 'Heavenly House'
      expect(spaces.first.space_address).to eq '666 Heavenly Street'
    end
  end

  # describe '.all' do
  #    it 'returns all bookmarks' do
  #      connection = PG.connect(dbname: 'bookmark_manager_test')
  #      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
  #      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
  #      Bookmark.create(url: "http://www.google.com", title: "Google")
  #      bookmarks = Bookmark.all
  #      expect(bookmarks.length).to eq 3
  #      expect(bookmarks.first).to be_a Bookmark
  #      expect(bookmarks.first.id).to eq bookmark.id
  #      expect(bookmarks.first.title).to eq "Makers Academy"
  #      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  #    end
end
