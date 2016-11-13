class PrivatePhotos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    post '' do
      pass unless logged_in?
      json_response succeed 'Photo saved', { :id => 971 }
    end

    post '/:id' do
      pass unless logged_in?
      json_response succeed 'Photo version saved', nil
    end

    patch '/photos/:id' do
      pass unless logged_in?
      json_response succeed 'Photo details updated', nil
    end

    delete '/photos/:id' do
      pass unless logged_in?
      json_response succeed 'Photo moved to TRASH', nil
    end

    get '/:id/history' do
      pass unless logged_in?
      json_response read_fixture 'private/history.json'
    end
  end
end
