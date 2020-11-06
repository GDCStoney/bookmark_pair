# frozen_string_literal: true

# Bookmark class for managing bookmark Objects
class Bookmark
  require 'pg'
  attr_reader :id, :url, :title

  def self.all
    puts connection_get.exec('SELECT CURRENT_USER AS myself;')[0]
    puts connection_get.exec('SELECT SESSION_USER AS myself;')[0]
    result = connection_get.exec('SELECT * FROM bookmarks ORDER BY id;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end
  end

  def self.create(title:, url:)
    result = connection_get.exec("INSERT INTO bookmarks(url, title)
      VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'],
      url: result[0]['url'])
  end

  def self.delete(id:)
    connection_get.exec("DELETE FROM bookmarks
      WHERE id=#{id} RETURNING id, title, url;")
  end

  def self.find(id:)
    result = connection_get.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.update(id:, title:, url:)
    result = connection_get.exec("UPDATE bookmarks
      SET title = '#{title}', url = '#{url}' WHERE id=#{id}
      RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

    def self.connection_get
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'bookmark_manager_test')
      else
        PG.connect(dbname: 'bookmark_manager')
      end
    end

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end
end
