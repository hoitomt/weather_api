require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'json'
require 'pry' if development?

configure do
  enable :logging
end

configure do
  set :views, 'app/views'
end

class GuineaPig < Sinatra::Application
  before do
    response['Access-Control-Allow-Origin'] = '*'
  end
end

require_relative 'routes/init'
require_relative 'models/init'
