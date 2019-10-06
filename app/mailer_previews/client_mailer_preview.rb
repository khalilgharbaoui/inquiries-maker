# frozen_string_literal: true

class ClientMailerPreview
  include ApplicationHelper
  def client
    ClientMailer.client response_body, inquiry
  end

  private

  def inquiry
    example = MovingInquiry.first
    example.locale = I18n.locale
    example
  end

  def response_body
    show_received_inquiry_response(inquiry)
  end
end
