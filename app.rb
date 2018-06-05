require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    url = params['url']
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  run if app_file == $0
end
