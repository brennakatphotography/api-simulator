require './helpers/any'

class Cors < Sinatra::Base
  Any.any do
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = "GET, POST, PUT, DELETE, OPTIONS"
    headers['Access-Control-Allow-Headers'] = "accept, authorization, origin"
    pass
  end
end
