require 'bookmark'


describe Bookmark do
  describe ".all" do
    it "returns a list of the bookmarks" do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.amazon.com', 'Amazon');")



      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.amazon.com")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create('http://www.testbookmark.com', 'Test Bookmark')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end
  end
end
