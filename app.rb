require 'sinatra/base'
require 'sinatra/namespace'
require './helpers/json'
require './helpers/auth'
require './routes/photos'
require './routes/folders'
require './routes/auth'
require './cors'

class PhotoAPI < Sinatra::Base
  use Cors
  use Photos
  use Folders
  use Auth

  get '/healthcheck' do
    json_response :system => "OK"
  end
end
