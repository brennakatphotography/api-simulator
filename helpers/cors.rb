class Cors < Sinatra::Base
  register Sinatra::MultiRoute

  route :get, :post, :put, :delete, :options, '/*' do
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET,POST,PUT,DELETE,OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
    pass
  end
end
