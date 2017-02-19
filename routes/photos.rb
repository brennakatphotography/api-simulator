require './routes/private/photos'

class Photos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    use PrivatePhotos
  end
end
