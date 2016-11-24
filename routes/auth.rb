class Auth < Sinatra::Base
  register Sinatra::Namespace

  namespace '/auth' do
    get '/login' do
      redirect to [
        "#{request.scheme}://#{params['redirect_host']}",
        params['redirect_path'],
        '?token=',
        make_token
      ].join ''
    end
  end
end
