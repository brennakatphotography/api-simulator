require './routes/private/photos'

class Photos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    use PrivatePhotos

    get '/:id' do
      send_file File.expand_path 'fixtures/photo.jpg'
    end
  end
end
