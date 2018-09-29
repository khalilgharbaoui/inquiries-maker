# frozen_string_literal: true

class MovuTransceiver
  attr_reader :inquiry, :inquiry_json, :api_url
  attr_accessor :response

  def initialize(inquiry)
    @inquiry = inquiry
    @inquiry_json = MovuJsonBuilder.build(inquiry)
    @api_url = Cre.dig(:partner_url) + Cre.dig(:partner_api_path)
  end

  def self.transceive(inquiry)
    new(inquiry).send(:send_and_receive)
  end

  private

  def send_and_receive
    self.response = HttpRequester.post(inquiry_json, api_url)
    # NOTE: BUG when not using this log function some jobs get "rejected"!
    # I think it has todo with NET::HTTP. Will be trying others soon!
    log(response) # keep this here for now!
    response.code == "200" ? create_received : TelegramNotifier.new(log(response))
  end

  def create_received
    ReceivedInquiryResponse.create!(
      :"#{inquiry.class.name.underscore}_id" =>  inquiry.id,
      :response_body => response.body
    )
  end

  def log(response)
    ResponseLogger.log(response)
  end
end
