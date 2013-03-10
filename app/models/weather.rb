class Weather
  class << self
    def get_current_weather(geo_data, api_key)
      return {} if geo_data.nil?
      url = Url.conditions_url(geo_data, api_key)
      Request.make(url)
    end
  end
end