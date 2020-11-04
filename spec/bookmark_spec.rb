# frozen_string_literal: true

require 'bookmark'

RSpec.describe Bookmark do
  describe 'class method #all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (id, title, url)
        VALUES (1, 'Makers Academy', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (id, title, url)
        VALUES(2, 'Symantec US', 'http://www.symantec.com');")
      connection.exec("INSERT INTO bookmarks (id, title, url)
        VALUES(3, 'Google UK', 'http://www.google.co.uk');")

      bookmarks = Bookmark.all

      expect(bookmarks.first).to be_an_instance_of(Bookmark)
      expect(bookmarks.first.title).to eq('Makers Academy')
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
      expect(bookmarks.first.id).to eq '1'
    end
  end

  describe '#create' do
    it '- adds a bookmark to the database' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

      bookmarks = Bookmark.all

      expect(bookmarks.size).to eq 1
      expect(bookmarks.last.id).to eq bookmark[0]['id']
      expect(bookmarks.last.url).to eq('http://www.testbookmark.com')
      expect(bookmarks.last.title).to eq('Test Bookmark')
    end
  end
end
