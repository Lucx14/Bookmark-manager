require 'pg'
require 'uri'
require_relative './database_connection'

class Bookmark

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(bookmark["id"], bookmark["url"], bookmark["title"])
    end
  end

  def self.create(url, title)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end


  def self.update(id, url, title)
    result = DatabaseConnection.query("UPDATE bookmarks SET title='#{title}', url='#{url}' WHERE id='#{id}' RETURNING id, url, title;")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end


  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end


  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end


  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
