require './routes/private/folders'

class Folders < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/folders' do
    use PrivateFolders

    get '' do
      json_response read_fixture 'public-folders.json'
    end

    get '/:id' do
      json_response read_fixture 'public-folder.json'
    end
  end
end
