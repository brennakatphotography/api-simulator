require 'sinatra/base'
require 'sinatra/namespace'
require './helpers/json'
require './routes/photos'

class PhotoAPI < Sinatra::Base
  use Photos

  get '/healthcheck' do
    json_response :system => "OK"
  end
end
