class PrivatePhotos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    post '' do
      pass unless logged_in?
      json_response succeed 'Photo saved', { :id => 971 }, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end

    post '/:id' do
      pass unless logged_in?
      json_response succeed 'Photo version saved', nil, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end

    patch '/:id' do
      pass unless logged_in?
      json_response succeed 'Photo details updated', nil, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end

    delete '/:id' do
      pass unless logged_in?
      json_response succeed 'Photo moved to TRASH', nil, { :role => 'power-user', :email => 'fake213@nothing.void', :verified => true }
    end

    get '/:id/history' do
      pass unless logged_in?
      json_response read_fixture 'private/history.json'
    end
  end
end
