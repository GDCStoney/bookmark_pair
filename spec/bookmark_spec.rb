# frozen_string_literal: true

require 'bookmark'

RSpec.describe Bookmark do
  describe 'class method #all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
     connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.symantec.com');")
     connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.co.uk');")

     bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.symantec.com')
      expect(bookmarks).to include('http://www.google.co.uk')
    end
  end

  describe '#create' do
    it '- adds a bookmark to the database' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.testbookmark.com')
    end
  end
end
