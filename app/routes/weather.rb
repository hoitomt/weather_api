class GuineaPig < Sinatra::Application

  before '/weather/:api_key/*/g/:lat/:lng/?' do
    @geo_data = GeoData.retrieve_by_lat_lng(params[:lat], params[:lng], params[:api_key])
  end

  before '/weather/:api_key/*/z/:zip/?' do
    @geo_data = GeoData.retrieve_by_zip(params[:zip], params[:api_key])
  end

  before '/weather/:api_key/*/s/:state/:city/?' do
    @geo_data = GeoData.new(params)
  end

  get '/weather/?' do
    slim :'weather/index', :layout => :'layout/application'
  end

  get '/weather/conditions/?' do
    slim :'weather/conditions', :layout => :'layout/application'
  end

  get '/weather/:api_key/conditions/*/?' do
    if @geo_data
      Weather.get_current_weather(@geo_data, params[:api_key])
    else
      slim :'weather/error', :layout => :'layout/application'
    end
  end
end