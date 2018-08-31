require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    [
      "http://www.google.com",
      "http://www.makersacademy.com",
      "http://www.amazon.com"
    ]
  end



  run! if app_file == $0

end
