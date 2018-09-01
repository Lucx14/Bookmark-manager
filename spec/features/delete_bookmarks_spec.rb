feature 'Delete bookmark' do
  # as a web user
  # so i can remove a weblink from the bookmarks
  # i want to be able to delete a bookmark
  scenario 'Deleting a bookmark' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")


    visit('/bookmarks')
    expect(page).to have_link("Google", :href => "http://www.google.com")
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Google", :href => "http://www.google.com")







    visit('/bookmarks')

  end

end
