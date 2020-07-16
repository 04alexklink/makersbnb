# frozen_string_literal: true

require 'pg'

p 'Setting up test database...'
def setup_test_database
  connection = PG.connect(dbname: 'mobbnb_test')

  # Clear the bookmarks table
  connection.exec('TRUNCATE users;')
end
