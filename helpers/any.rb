class Any < Sinatra::Base
  def self.any &block
    get '/*', &block
    post '/*', &block
    put '/*', &block
    patch '/*', &block
    delete '/*', &block
    options '/*', &block
    head '/*', &block
  end
end
