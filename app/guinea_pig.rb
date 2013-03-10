require 'sinatra'
require 'sinatra/reloader' if development?
require 'data_mapper'
require 'slim'
require 'json'
require 'pry' if development?

configure do
  enable :logging
end

configure do
  set :db_path, "postgres://hoitomt:badger@localhost/guinea_pig"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || settings.db_path)
  set :views, 'app/views'
end

class GuineaPig < Sinatra::Application

end

require_relative 'routes/init'
require_relative 'models/init'
