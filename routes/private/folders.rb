class PrivateFolders < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/folders' do
    get '' do
      pass unless valid_token?
      json_response :private => true
    end
  end
end
