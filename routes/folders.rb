require './routes/private/folders'

class Folders < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/folders' do
    use PrivateFolders

    get '' do
      json_response read_fixture 'folders.json'
    end

    get '/:id' do
      json_response read_fixture 'folder.json'
    end
  end
end
