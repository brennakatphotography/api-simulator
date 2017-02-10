class Auth < Sinatra::Base
  register Sinatra::Namespace

  namespace '/auth' do
    get '/login' do
      redirect to [
        params['redirect_uri'],
        '?token=',
        make_token
      ].join ''
    end
  end
end
