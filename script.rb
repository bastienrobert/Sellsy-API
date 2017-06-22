# Require : if you use Ruby on Rails, it's already include !

require 'uri'
require 'net/http'
require 'json'
require 'securerandom'

# Define parameters for the demonstration

@request = 'Client.getList'
@params = {
    'pagination' => {
        'nbperpage' => 15
    },
    'search' => {
        'name' => 'test'
    }
}

# Launch the function with the demonstration params

sellsy_request(@request, @params)


## Here is the function

def sellsy_request(sellsy_request, sellsy_params)
  # Set the API URL
  url = URI("https://apifeed.sellsy.com/0/")

  # Define the timestamp & a random nonce
  timestamp = Time.now.to_i
  nonce = SecureRandom.hex(6)

  # Setup the URL host and port, and force to use SSL (Sellsy don't authorize request without TLS)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  # Store the POST request in a new var
  request = Net::HTTP::Post.new(url)
  # HTTP request headers
  request["cache-control"] = 'no-cache'
  request["accept"] = '*/*'
  request["content-type"] = 'application/x-www-form-urlencoded'
  # HTTP request body
  request.set_form_data(
    "do_in" => {
      "method" => sellsy_request,
      "params" => sellsy_params
    }.to_json,
    "io_mode" => "json",
    "request" => 1,
    "oauth_consumer_key" => "YOUR CONSUMER KEY",
    "oauth_token" => "YOUR TOKEN KEY",
    "oauth_signature_method" => "PLAINTEXT",
    "oauth_timestamp" => timestamp,
    "oauth_nonce" => nonce,
    "oauth_version" => 1.0,
    "oauth_signature" => "YOUR CONSUMER SECRET & YOUR TOKEN SECRET"
  ).to_json

  # Launch the HTTP request
  response = http.request(request)
  # Return the response
  return response.read_body
end
