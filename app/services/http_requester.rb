# frozen_string_literal: true

# This PORO simply has 1 class method post that make an HTTP POST request
# to a API endpoint URL,While carrying a JSON payload in the request body.
# Its outcome is an HTTP response object with headers, response_body etc...
class HttpRequester
  attr_reader :json, :uri
  attr_accessor :http, :response, :request

  def initialize(json, url)
    @json = json
    @uri = URI.parse(url)
  end

  def self.post(json, url)
    new(json, url).send(:http_response)
  end

  private

  def http_response
    self.response = http_object.request(post_request) # make the post request
    response.body.force_encoding('utf-8') # force utf-8 because Net::HTTP SUCKS!
    return response
  end

  def http_object
    self.http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    return http
  end

  def post_request
    self.request = Net::HTTP::Post.new(uri.request_uri)
    request['accept'] = 'application/json'
    request['content-type'] = 'application/json'
    request.body = json.force_encoding('utf-8')
    return request
  end
end
