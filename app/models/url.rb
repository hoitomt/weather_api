class Url
  class << self
    def conditions_url(geo_data, api_key)
      "http://api.wunderground.com/api/#{api_key}/conditions/q/#{geo_data.state_code}/#{geo_data.city}.json"
    end

    def geolookup_url(latitude, longitude, api_key)
      "http://api.wunderground.com/api/#{api_key}/geolookup/q/#{latitude},#{longitude}.json"
    end

    def geolookup_zip_url(zip, api_key)
      "http://api.wunderground.com/api/#{api_key}/geolookup/q/#{zip}.json"
    end
  end
end