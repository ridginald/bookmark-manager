require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
      # Add the test data
      bookmark_1 = Bookmark.create(url: "http://makersacademy.com")
      bookmark_2 = Bookmark.create(url: "http://destroyallsoftware.com")
      bookmark_3 = Bookmark.create(url: "http://google.com")

      expected_bookmarks = [
        "http://makersacademy.com",
        "http://destroyallsoftware.com",
        "http://google.com"
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real bookmark')
      expect(Bookmark.all).not_to include 'not a real bookmark'
    end


  end

  describe '.delete' do
    it 'deletes a bookmark' do
      Bookmark.delete(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).not_to include 'http://www.testbookmark.com'
    end
  end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark_1 = Bookmark.new(1, url: 'http://www.testbookmark.com')
      bookmark_2 = Bookmark.new(1, url: 'http://www.testbookmark.com')

      expect(bookmark_1).to eq bookmark_2
    end
  end

end
