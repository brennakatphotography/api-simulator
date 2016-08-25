class Photos < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1/photos' do
    get '' do
      json_response read_fixture 'test.json'
    end
  end
end
