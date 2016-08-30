class Photos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    get '/:id' do
      send_file File.expand_path 'fixtures/test.jpg'
    end
  end
end
