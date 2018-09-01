require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.create(params['url'], params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add"
  end



  run! if app_file == $0

end
