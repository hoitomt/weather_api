Weather API
===========

What is it?
-----------
This code represents a proxy for the wunderground API (http://www.wunderground.com/weather/api/d/docs). The endpoints mentioned below wrap the wunderground api to provide the following benefits
1. Open access: Access-Control-Allow-Origin: * has been added to the header so that the endpoints are callable from javascript without Cross-Origin request errors
2. Expanded Geo Support: The Weather API adds support for Zip Code requests and Latitude/Longitude requests even in instances where the wunderground API accepts a city/state

What endpoints are supported?
-----------------------------
The following features are supported
1. Conditions - Gives the current conditions at a location (http://www.wunderground.com/weather/api/d/docs?d=data/conditions). An overview of the conditions endpoints is availalble at http://localhost:9393/weather/conditions.
The wunderground api only supports a state/city endpoint for the current conditions. However this weather API will translate Zip Code and Latitude/Longitude prior to calling the wunderground service. Conditions are available at three different endpoints.

  1. Zip Code
    http://localhost:9393/weather/api_key/conditions/z/ZipCode
  2. State/City
    http://localhost:9393/weather/api_key/conditions/s/StateCode/City
  3. Latitude and Longitude
    http://localhost:9393/weather/api_key/conditions/g/latitude/longitude