require 'jwt'

def test_user
  {
    "user" => {
      "id" => 33,
      "social_id" => "123456789",
      "email" => "test@user.email",
      "name" => "Test User",
      "image" => "http://www.example.com/photo.jpg"
    },
    "iat" => 1471832205,
    "exp" => 1479608205
  }
end

def get_headers header
  env["HTTP_#{header.upcase}"]
end

def get_auth_token
  token = get_headers 'authorization'
  token && token[7..-1]
end

def logged_in?
  begin
    !!(JWT.decode get_auth_token, ENV['TOKEN_SECRET'], true, { :algorithm => 'HS256' })
  rescue
    false
  end
end

def make_token
  JWT.encode test_user, ENV['TOKEN_SECRET'], 'HS256'
end
