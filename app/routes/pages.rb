class GuineaPig < Sinatra::Application
  get '/' do
    logger.info("Log it")
    slim :'pages/index', :layout => :'layout/application'
  end
end