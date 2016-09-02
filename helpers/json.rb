require 'json'

def json_response(data, code=200)
  [code, {"Content-Type" => "application/json"}, [data.to_json]]
end

def read_fixture file
  JSON.parse File.read "#{__dir__}/../fixtures/#{file}"
end

def succeed message, data
  { :success => true, :message => message, :data => data }
end

def fail message, error
  { :success => false, :message => message, :error => error }
end
