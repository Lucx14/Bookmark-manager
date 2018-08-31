require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Testing infrastructure working'
  end



  run! if app_file == $0

end
