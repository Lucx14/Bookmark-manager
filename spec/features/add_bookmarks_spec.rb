feature 'Adding bookmarks' do
  # As a web user
  # so i can save my favourite websites
  # i want to be able to add a website to my bookmarks
  scenario 'Adding a bookmark to Bookmark Manager' do
    visit('/bookmarks')
    click_button("Add link")
    fill_in('url', :with => 'http://www.sky.com')
    fill_in('title', :with => 'Sky')
    click_button("Submit")
    expect(page).to have_content("http://www.sky.com")
  end



end
