class PrivateFolders < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/folders' do
    get '' do
      pass unless logged_in?
      json_response read_fixture 'private/folders.json'
    end

    post '' do
      pass unless logged_in?
      json_response succeed 'Folder created', { :id => 744 }
    end

    get '/root' do
      pass unless logged_in?
      json_response read_fixture 'folder.json'
    end

    get '/:id' do
      pass unless logged_in?
      json_response read_fixture 'folder.json'
    end

    put '/:id' do
      pass unless logged_in?
      json_response succeed 'Folder updated', nil
    end

    delete '/:id' do
      pass unless logged_in?
      json_response succeed 'Folder moved to TRASH', nil
    end
  end
end
