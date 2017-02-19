class PrivateFolders < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/folders' do
    get '' do
      pass unless logged_in?
      json_response read_fixture 'private/folders.json'
    end

    post '' do
      pass unless logged_in?
      json_response succeed 'Folder created', { :id => 744 }, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end

    get '/root' do
      pass unless logged_in?
      json_response read_fixture 'root.json'
    end

    get '/:id' do
      pass unless logged_in?
      json_response read_fixture 'private/folder.json'
    end

    patch '/:id' do
      pass unless logged_in?
      json_response succeed 'Folder updated', nil, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end

    delete '/:id' do
      pass unless logged_in?
      json_response succeed 'Folder moved to TRASH', nil, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end
  end
end
