require './routes/private/folders'

class Folders < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/folders' do
    use PrivateFolders

    get '' do
      fixture = (params['name']) ? 'folder.json' : 'folders.json'
      json_response read_fixture fixture
    end

    get '/:id' do
      json_response read_fixture 'folder.json'
    end
  end
end
