require 'sinatra/base'
require 'uri'
require './lib/bookmark'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
      flash[:notice] = "You must submit a valid URL." unless Bookmark.create(params['url'], params['title'])
      redirect '/bookmarks'
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add"
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end


  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:url], params[:title])
    redirect('/bookmarks')
  end



  run! if app_file == $0

end
