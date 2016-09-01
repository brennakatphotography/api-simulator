def any
  headers['Access-Control-Allow-Origin'] = "*"
  headers['Access-Control-Allow-Methods'] = "GET, POST, PUT, DELETE, OPTIONS"
  headers['Access-Control-Allow-Headers'] = "accept, authorization, origin"
  pass
end

class Cors < Sinatra::Base
  options '/*' do any end
  head '/*' do any end
  put '/*' do any end
  patch '/*' do any end
  delete '/*' do any end
  get '/*' do any end
  post '/*' do any end
end
