require 'bookmark'
describe Bookmark do
  describe ".all" do
    it "returns a list of the bookmarks" do

      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.amazon.com', 'Amazon');")

      bookmarks = Bookmark.all
      bookmark = bookmarks.first
      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq("Google")
      expect(bookmark.url).to eq("http://www.google.com")
    end
  end


  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create('http://www.testbookmark.com', 'Test Bookmark')
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq('Test Bookmark')
    end


    it "does not create a new bookmark if the URL is invalid" do
      Bookmark.create('not a real bookmark', 'not real')
      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end


  describe ".delete" do
    it "deletes a bookmark" do
      bookmark = Bookmark.create("http://www.google.com", "Google")
      Bookmark.delete(bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe ".update" do
    it "updates the bookmark with the given data" do
      bookmark = Bookmark.create("http://www.makersacademy.com", "Makers Academy")
      updated_bookmark = Bookmark.update(bookmark.id, "http://www.fakersacademy.com", "Fakers Academy")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq("Fakers Academy")
      expect(updated_bookmark.url).to eq("http://www.fakersacademy.com")
    end
  end



end
