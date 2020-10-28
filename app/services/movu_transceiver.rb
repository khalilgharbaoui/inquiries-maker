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
    if inquiry.client_email == Cre.dig(:gmail_username)
      TelegramNotifier.new(ResponseLogger.log(inquiry_json))
      {}
    else
      self.response = HttpRequester.post(inquiry_json, api_url)
      if response.code == '200'
        response
      else
        TelegramNotifier.new(ResponseLogger.log(response))
      end
    end
  end
end
