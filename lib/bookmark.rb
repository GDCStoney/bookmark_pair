# frozen_string_literal: true

# Bookmark class for managing bookmark Objects
class Bookmark
  require 'pg'
  attr_reader :id, :url, :title

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end
  end

  def self.create(title:, url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks(url, title)
      VALUES('#{url}', '#{title}') RETURNING id, title, url;")
  end

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end
end
