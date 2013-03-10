class GeoData

  attr_accessor :lat, :lon, :city, :state, :zip

  def initialize(params)
    parse_params(params)
  end

  def parse_params(params)
    return unless params
    params.each do |k, v|
      begin
        send("#{k.to_sym}=", v)
      rescue Exception => e
      end
    end
  end

  def latitude
    @lat
  end

  def longitude
    @lon
  end

  def state_code
    @state
  end

  def city
    @city.gsub(' ', '_') if @city
  end

  def to_s
    "#{state}, #{city}, #{zip}, #{lat}, #{lon}"
  end

  class << self
    def retrieve_by_lat_lng(latitude, longitude, api_key)
      return nil unless valid_coordinates?(latitude, longitude)
      url = Url.geolookup_url(latitude, longitude, api_key)
      result = JSON.parse(Request.make(url))
      GeoData.new(result['location'])
    end

    def retrieve_by_zip(zip, api_key)
      url = Url.geolookup_zip_url(zip, api_key)
      result = JSON.parse(Request.make(url))
      GeoData.new(result['location'])
    end

    def valid_coordinates?(latitude, longitude)
      regex = /^-?((\d{1,3})|(\d{1,3}\.\d+))$/
      latitude =~ regex && longitude =~ regex
    end

    def example_response
      {
        "response"=>{
          "version"=>"0.1",
          "termsofService"=>"http://www.wunderground.com/weather/api/d/terms.html",
          "features"=>{
            "geolookup"=>1
          }
        },
        "location"=>{
          "type"=>"CITY",
          "country"=>"US",
          "country_iso3166"=>"US",
          "country_name"=>"USA",
          "state"=>"WI",
          "city"=>"Eau Claire",
          "tz_short"=>"CST",
          "tz_long"=>"America/Chicago",
          "lat"=>"44.811349",
          "lon"=>"-91.498494",
          "zip"=>"54702",
          "magic"=>"1",
          "wmo"=>"99999",
          "l"=>"/q/zmw:54702.1.99999",
          "requesturl"=>"US/WI/Eau_Claire.html",
          "wuiurl"=>"http://www.wunderground.com/US/WI/Eau_Claire.html",
          "nearby_weather_stations"=>{
            "airport"=>{
              "station"=>[
                {"city"=>"Eau Claire", "state"=>"WI", "country"=>"US", "icao"=>"KEAU", "lat"=>"44.86999893", "lon"=>"-91.48999786"},
                {"city"=>"Menomonie", "state"=>"WI", "country"=>"US", "icao"=>"KLUM", "lat"=>"44.88999939", "lon"=>"-91.87000275"},
                {"city"=>"Rice Lake", "state"=>"WI", "country"=>"US", "icao"=>"KRPD", "lat"=>"45.41999817", "lon"=>"-91.76999664"},
                {"city"=>"Black River Falls", "state"=>"WI", "country"=>"US", "icao"=>"KBCK", "lat"=>"44.25000000", "lon"=>"-90.86000061"}
              ]
            },
            "pws"=>{
              "station"=>[
                {
                  "neighborhood"=>"Phillips Hall Rooftop",
                  "city"=>"Eau Claire",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"KWIEAUCL13",
                  "lat"=>44.797062,
                  "lon"=>-91.499374,
                  "distance_km"=>1,
                  "distance_mi"=>0
                },
                {
                  "neighborhood"=>"Memorial High area",
                  "city"=>"Eau Claire",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"KWIEAUCL15",
                  "lat"=>44.795639,
                  "lon"=>-91.480476,
                  "distance_km"=>2,
                  "distance_mi"=>1
                },
                {
                  "neighborhood"=>"Lorick Weather Live",
                  "city"=>"Eau Claire",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"KWIEAUCL1",
                  "lat"=>44.78788,
                  "lon"=>-91.516281,
                  "distance_km"=>2,
                  "distance_mi"=>1
                },
                {
                  "neighborhood"=>"Jeffers Road&Hwy 312 (North Crossing)",
                  "city"=>"Eau Claire",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"KWIEAUCA2",
                  "lat"=>44.843655,
                  "lon"=>-91.524216,
                  "distance_km"=>4,
                  "distance_mi"=>2
                },
                {
                  "neighborhood"=>"Meadowbrook Subdivision",
                  "city"=>"Eau Claire",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"KWIEAUCL10",
                  "lat"=>44.768127,
                  "lon"=>-91.488434,
                  "distance_km"=>4,
                  "distance_mi"=>2
                },
                {
                  "neighborhood"=>"APRSWXNET Altoona WI US",
                  "city"=>"Altoona",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"MAU140",
                  "lat"=>44.80872,
                  "lon"=>-91.420372,
                  "distance_km"=>6,
                  "distance_mi"=>3
                },
                {
                  "neighborhood"=>"WIDOT Eau Claire - I-94 @ USH 53",
                  "city"=>"Altoona",
                  "state"=>"WI",
                  "country"=>"US",
                  "id"=>"MECRW3",
                  "lat"=>44.767929,
                  "lon"=>-91.423668,
                  "distance_km"=>7,
                  "distance_mi"=>4
                }, {"neighborhood"=>"South Lowes Creek / Hubbard", "city"=>"Eau Claire", "state"=>"WI", "country"=>"US", "id"=>"KWIEAUCL6", "lat"=>44.731796, "lon"=>-91.462975, "distance_km"=>9, "distance_mi"=>5},
                {"neighborhood"=>"APRSWXNET Chippewa Falls WI US", "city"=>"Colfax", "state"=>"WI", "country"=>"US", "id"=>"MAU450", "lat"=>44.956829, "lon"=>-91.586166, "distance_km"=>17, "distance_mi"=>10},
                {"neighborhood"=>"Albertville", "city"=>"Colfax", "state"=>"WI", "country"=>"US", "id"=>"KWICOLFA2", "lat"=>44.965595, "lon"=>-91.638664, "distance_km"=>20, "distance_mi"=>12},
                {"neighborhood"=>"Bateman", "city"=>"Chippewa Falls", "state"=>"WI", "country"=>"US", "id"=>"KWICHIPP3", "lat"=>44.928669, "lon"=>-91.270554, "distance_km"=>22, "distance_mi"=>13},
                {"neighborhood"=>"Lake Wissota", "city"=>"Chippewa Falls", "state"=>"WI", "country"=>"US", "id"=>"KWICHIPP4", "lat"=>44.980659, "lon"=>-91.341286, "distance_km"=>22, "distance_mi"=>13},
                {"neighborhood"=>"MesoWest RUSK WI US UPR", "city"=>"Menomonie", "state"=>"WI", "country"=>"US", "id"=>"MUP460", "lat"=>44.908131, "lon"=>-91.835983, "distance_km"=>28, "distance_mi"=>17},
                {"neighborhood"=>"", "city"=>"Osseo", "state"=>"WI", "country"=>"US", "id"=>"KWIOSSEO2", "lat"=>44.589588, "lon"=>-91.27227, "distance_km"=>30, "distance_mi"=>18},
                {"neighborhood"=>"RAWS AUGUSTA WI US", "city"=>"Augusta", "state"=>"WI", "country"=>"US", "id"=>"MAFWW3", "lat"=>44.698101, "lon"=>-91.134201, "distance_km"=>31, "distance_mi"=>18},
                {"neighborhood"=>"Jim Falls 3W", "city"=>"Jim Falls", "state"=>"WI", "country"=>"US", "id"=>"KWIJIMFA1", "lat"=>45.082558, "lon"=>-91.330109, "distance_km"=>32, "distance_mi"=>19}
              ]
            }
          }
        }
      }
    end
  end
end
