# frozen_string_literal: true

require 'bookmark'

RSpec.describe Bookmark do
  describe 'class method #all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.symantec.com')
      expect(bookmarks).to include('http://www.google.co.uk')
    end
  end
end
