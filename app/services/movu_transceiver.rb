# frozen_string_literal: true

class MovuTransceiver
  def initialize(inquiry)
    @inquiry = inquiry
    @response = nil
    @api_url = Rails.application.credentials.dig(Rails.env.to_sym, :partner_url) +
               Rails.application.credentials.dig(Rails.env.to_sym, :partner_api_path)
  end

  def preform
    send_request
  end

  private

  def send_request
    inquiry_json = MovuJsonBuilder.new(@inquiry).call
    @response = HttpPostRequester.new(inquiry_json, @api_url).call
    ResponseLogger.new(@response, @inquiry).call
    @response.code == "200" ? receive_response : TelegramNotifier.new(HttpStatusCodeLogger.new(@response.code).call)
  end

  def receive_response
    ReceivedInquiryResponse.create!(
      :"#{@inquiry.class.name.underscore}_id" =>  @inquiry.id,
      :response_body => @response.body
    )
  end
end
