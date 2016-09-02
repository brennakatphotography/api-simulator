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

  get '*' do any end
  post '*' do any end
  put '*' do any end
  patch '*' do any end
  delete '*' do any end
  options '*' do any end
  head '*' do any end
end

def any
  if logged_in?
    response = fail 'Unknown private resource', :logged_in => true
  else
    response = fail 'Unknown public resource', :logged_in => false
  end
  json_response response, 400
end
