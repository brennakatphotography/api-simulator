require 'sinatra/base'
require 'sinatra/namespace'
require './helpers/json'
require './routes/photos'
require './routes/folders'

class PhotoAPI < Sinatra::Base
  use Photos
  use Folders

  get '/healthcheck' do
    json_response :system => "OK"
  end
end
