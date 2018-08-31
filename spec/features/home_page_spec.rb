feature 'Home page' do
  scenario 'user can go to the homepage and see a welcome message' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end
