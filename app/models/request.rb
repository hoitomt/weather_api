require 'rest_client'

class Request
  def self.make(url)
    p "URL #{url}"
    response = RestClient.get(url) || {}
  end
end