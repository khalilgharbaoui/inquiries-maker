class MovuTransceiver
require 'uri'
require 'net/http'
require 'openssl'
require 'active_support/all'
require 'json'
require 'date'
require 'json-prettyprint'

  def initialize(inquiry)
    @inquiry = inquiry
    @response = nil
  end


  def post
    exclusions = [:id, :created_at, :updated_at]
    credentials = {
      origin: 'thirdparty_partner',
      partner_token: Rails.application.credentials.dig(Rails.env.to_sym,:movu_partner_token)
    }
    utm_params = {
      utm_campaign: 'umzug-offerte-schweiz',
      utm_term: 'umzug-offerte-schweiz',
      utm_content: 'umzug-offerte-schweiz'
    }
    inclusions = credentials.merge(utm_params)
    inquiry_json = @inquiry
    .as_json(except: exclusions)
    .merge( inclusions )
    .to_json
    @response = create_http_object(inquiry_json)
    statistics(@response, @inquiry)
  end

  def received
    #if response header is 200 meaning the server on the other side received my lead successfully. go ahead and save the response in my database. and with an association to the lead it self.
    if @response.code == "200"

      # TODO: ResponseFilter should filter and create object like:
      # ReceivedMovingInquiryResponse
      # ReceivedCleaningIquiryResponse
      # ReceivedCleaningInquiryResponse
      # etc...
      # but the name FILTER DOES NOT QUITE FIT.
      # And the responsibilty is not inside the Received inquiry response itself
      # it does too much.
      # this feels like a duck but how to name it?
      ReceivedInquiryResponse.create!(
        :"#{@inquiry.class.name.underscore}_id" =>  @inquiry.id,
        :response_body => @response.body
      )
    elsif @response.code == "400"
      puts "validation error!"
      statistics(@response, @inquiry)
    else
      puts "Exeption"
      statistics(@response, @inquiry)
    end
    statistics(@response, @inquiry)
  end

  def statistics(response, inquiry)
    puts "Headers: "
    puts JSON::PrettyPrint.prettify(response.to_json) if response

    puts "Status:"
    puts "Code: " + response.code  if response.code      # => '200'
    puts "Message: "+ response.message  if response.message  # => 'OK'
    puts "Class Name: " + response.class.name if response.class.name# => 'HTTPOK'

    puts "Response body: "
    puts JSON::PrettyPrint.prettify(response.body) if response.body
    puts "⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️"
    puts "LEAD ID: #{inquiry.id} !!"
    puts "LEAD ID: #{inquiry.class.name} !!"
  end

  private
    def create_http_object(json)
      movu_url = Rails.application.credentials.dig(Rails.env.to_sym, :movu_staging_url)
      movu_path = Rails.application.credentials.dig(Rails.env.to_sym, :movu_api_path)
      constructed_url = movu_url + movu_path
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
end
