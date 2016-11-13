require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/multi_route'

require './helpers/json'
require './helpers/auth'
require './helpers/cors'
require './routes/auth'
require './routes/folders'
require './bin/photos'

class PhotoAPI < Sinatra::Base
  register Sinatra::MultiRoute

  use Cors
  use Auth
  use Folders
  use Photos

  get '/healthcheck' do
    json_response :system => 'OK'
  end

  route :get, :post, :put, :patch, :delete, :options, :head, '*' do
    if logged_in?
      response = fail 'Unknown private resource', :logged_in => true
    else
      response = fail 'Unknown public resource', :logged_in => false
    end
    json_response response, 400
  end
end
