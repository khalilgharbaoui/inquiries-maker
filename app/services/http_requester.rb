# frozen_string_literal: true

# This PORO simply has 1 class method post that make an HTTP POST request
# to a API endpoint URL,While carrying a JSON payload in the request body.
# Its outcome is an HTTP response object with headers, response_body etc...
class HttpRequester
  def initialize(json, url)
    @json = json
    @uri = URI.parse(url)
  end

  def self.post(json, url)
    new(json, url).send(:post)
  end

  private

  def post
    response = http_object.request(http_post_object) # make the post request
    warn "💡 #{response.code} => #{response.message}"
    return response
  end

  def http_object
    http = Net::HTTP.new(@uri.host, @uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end

  def http_post_object
    request = Net::HTTP::Post.new(@uri.request_uri)
    request['accept'] = 'application/json'
    request['content-type'] = 'application/json'
    request.body = @json
    request
  end
end
