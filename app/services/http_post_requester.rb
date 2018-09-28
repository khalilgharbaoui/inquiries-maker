# frozen_string_literal: true

# This PORO simply creates an HTTP POST request to a URL,
# while carrying a JSON payload in the request body.
# Its outcome is an HTTP response object with headers, response_body etc.
class HttpPostRequester
  def initialize(json, url)
    @json = json
    @uri = URI.parse(url)
  end

  def call
    create_http_response
  end

  private

  def create_http_response
    http = Net::HTTP.new(@uri.host, @uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.request(post_request_object) # make the post request
  end

  def post_request_object
    request = Net::HTTP::Post.new(@uri.request_uri)
    request['accept'] = 'application/json'
    request['content-type'] = 'application/json'
    request.body = @json
    request
  end
end
