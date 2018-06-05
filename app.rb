require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  run if app_file == $0
end
