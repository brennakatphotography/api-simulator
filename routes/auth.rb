class Auth < Sinatra::Base
  register Sinatra::Namespace

  namespace '/auth' do
    get '/login' do
      redirect to [
        request.env['HTTP_ORIGIN'],
        params['redirect_url'] || '/#/login',
        '?token=',
        make_token
      ].join ''
    end
  end
end
