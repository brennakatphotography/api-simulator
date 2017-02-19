class PhotosBin < Sinatra::Base
  register Sinatra::Namespace
  def rand_1_to_3 id
    id >= 1 && id <= 3 ? id : Integer(Random.rand * 3 + 1)
  end

  namespace '/bin/v1/photos' do
    get '/:id' do
      pass unless logged_in?
      send_file File.expand_path 'bin/photos/private.jpg'
    end

    get '/:id' do
      id = rand_1_to_3 Integer(params[:id])
      send_file File.expand_path "bin/photos/public#{id}.jpg"
    end

    get '/:id/history/:history_id' do
      pass unless logged_in?
      send_file File.expand_path 'bin/photos/history.jpg'
    end
  end
end
