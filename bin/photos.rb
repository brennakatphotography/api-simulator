class Photos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/bin/v1/photos' do
    get '/:id' do
      pass unless logged_in?
      send_file File.expand_path 'bin/photos/private.jpg'
    end

    get '/:id' do
      send_file File.expand_path 'bin/photos/public.jpg'
    end

    get '/:id/history/:history_id' do
      pass unless logged_in?
      send_file File.expand_path 'bin/photos/history.jpg'
    end
  end
end
