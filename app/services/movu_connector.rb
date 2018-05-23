class MovuConnector
require 'uri'
require 'net/http'
require 'openssl'
require 'active_support/all'
require 'json'
require 'dotenv'
require 'date'
require 'json-prettyprint'


  def self.post(moving_inquiry_id)
    moving_inquiry = MovingInquiry.find(moving_inquiry_id)
    exclusions = [:id, :created_at, :updated_at]
    credentials = {
      origin: 'thirdparty_partner',
      partner_token: ENV["MOVU_PARTNER_TOKEN"]
    }
    utm_params = {
      utm_campaign: 'umzug-offerte-schweiz',
      utm_term: 'umzug-offerte-schweiz',
      utm_content: 'umzug-offerte-schweiz',
      client_salutation: "mr"
    }
    inclusions = credentials.merge(utm_params)
    inquiry_json = moving_inquiry
    .as_json(except: exclusions)
    .merge( inclusions )
    .to_json

    response = create_http_object(inquiry_json)
    statistics(response)
  end
  private

    def self.create_http_object(json)
      constructed_url = ENV["MOVU_STAGING_URL"] + ENV["MOVU_API_PATH"]
      uri = URI.parse(constructed_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri)
      request["accept"] = "application/json"
      request["content-type"] = "application/json"
      request.body = json
      puts json
      http.request(request) #make the post
    end
    def self.statistics(input)
      puts "Headers: "
      puts JSON::PrettyPrint.prettify(input.to_json) if input

      puts "Status:"
      puts "Code: " + input.code  if input.code      # => '200'
      puts "Message: "+ input.message  if input.message  # => 'OK'
      puts "Class Name: " + input.class.name if input.class.name# => 'HTTPOK'

      puts "Response body: "
      puts JSON::PrettyPrint.prettify(input.body) if input.body
      puts "⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️"
    end
end
