feature 'Viewing bookmarks' do
  # as a web user
  # so i can easily visit my favourite websites
  # I want to be able to see a list of my bookmarks
  scenario 'User is able to view all their bookmarks in a list' do
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.amazon.com")
  end
end
