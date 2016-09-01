require 'sinatra/base'
require 'sinatra/namespace'
require './helpers/json'
require './helpers/auth'
require './helpers/cors'
require './routes/auth'
require './routes/folders'
require './routes/photos'

class PhotoAPI < Sinatra::Base
  use Cors
  use Auth
  use Folders
  use Photos

  get '/healthcheck' do
    json_response :system => 'OK'
  end

  get '/test' do
    json_response :test => 'success'
  end
end
