require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/multi_route'

require './helpers/json'
require './helpers/auth'
require './helpers/cors'
require './routes/auth'
require './routes/folders'
require './routes/photos'
require './bin/photos'

class PhotoAPI < Sinatra::Base
  register Sinatra::MultiRoute

  use Cors
  use Auth
  use Folders
  use Photos
  use PhotosBin

  get '/healthcheck' do
    json_response :a => :ok
  end

  route :get, :post, :put, :patch, :delete, :options, :head, '*' do
    if logged_in?
      response = fail 'Unknown private resource', nil, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    else
      response = fail 'Unknown public resource', nil, { :role => nil, :email => nil, :verified => false }
    end
    json_response response, 400
  end
end
