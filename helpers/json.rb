require 'json'

def json_response(data, code=200)
  [code, {"Content-Type" => "application/json"}, [data.to_json]]
end

def read_fixture file
  JSON.parse File.read "#{__dir__}/../fixtures/#{file}"
end

def succeed message, data, authenticated
  { :messages => { :api => message, :authenticated => authenticated }, :data => data }
end

def fail message, error, authenticated
  { :messages => { :api => message, :authenticated => authenticated, :error => error } }
end
