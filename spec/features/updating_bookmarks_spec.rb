require 'pg'

feature 'updating bookmarks; ' do
  scenario 'a user can update bookmarks' do

    # Add the test data
    Bookmark.create(url: "http://makersacademy.com")

    visit('/bookmarks')
    fill_in('url', with: 'http://makersacademy.com')
    click_button('Update')

    expect(page).to have_content "http://makersacademy.com"
  end
end
