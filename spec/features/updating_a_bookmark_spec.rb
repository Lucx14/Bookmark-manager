feature 'Update a bookmark' do
  # as a web user
  # so that i can make a change to my bookmarks
  # i want to update a bookmark
  scenario "updating a bookmark" do

    bookmark = Bookmark.create('http://www.google.com', 'Google')

    visit('/bookmarks')
    expect(page).to have_link('Google', :href => 'http://www.google.com')

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "http://www.yahoo.com")
    fill_in('title', with: "Yahoo")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', :href => 'http://www.google.com')
    expect(page).to have_link('Yahoo', :href => 'http://www.yahoo.com')
  end
end
