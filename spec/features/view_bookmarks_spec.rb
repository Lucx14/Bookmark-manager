feature 'Viewing bookmarks' do
  # as a web user
  # so i can easily visit my favourite websites
  # I want to be able to see a list of my bookmarks
  scenario 'User is able to view all their bookmarks in a list' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.amazon.com', 'Amazon');")


    visit('/bookmarks')
    expect(page).to have_link("Google", :href => "http://www.google.com")
    expect(page).to have_link("Makers Academy", :href => "http://www.makersacademy.com")
    expect(page).to have_link("Amazon", :href => "http://www.amazon.com")
  end
end
