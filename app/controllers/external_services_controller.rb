require 'net/http'

class ExternalServicesController < AuthController
  before_action :authorized

  def fetch_data
    uri = URI('https://random.dog/woof.json')
    
    # Create a new HTTP object
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'

    # Create a new GET request
    request = Net::HTTP::Get.new(uri.path)
    
    # Add the token to the request headers
    request['Authorization'] = "Bearer #{@token}"

    # Send the request and get the response
    response = http.request(request)

    render json: response.body
  end
end
