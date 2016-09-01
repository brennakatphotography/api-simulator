class PrivatePhotos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    get '' do
      pass unless valid_token?
      json_response :private => true
    end
  end
end
