require 'pg'

feature 'deleting bookmarks; ' do
  scenario 'a user can delete bookmarks' do

    # Add the test data
    Bookmark.create(url: "http://makersacademy.com")

    visit('/bookmarks')
    fill_in('url', with: 'http://makersacademy.com')
    click_button('Delete')

    visit('/bookmarks')
    expect(page).not_to have_content "http://makersacademy.com"
  end
end
