require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'uri'
require 'open-uri'
require 'pathname'

TEMP_DIR = 'tmp'

configure do
  set :tmp, File.join(settings.root, 'tmp')
end

get '/' do
  
  unless params[:proxy]
    'Hello'
  else
    uri = URI.parse(params[:proxy])
    path = Pathname.new uri.to_s
    open uri.to_s do |f|
      content_type f.content_type
      send_file f
    end
  end
  
end
