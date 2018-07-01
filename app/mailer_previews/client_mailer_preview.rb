class ClientMailerPreview
  include ApplicationHelper
  def client
    ClientMailer.client response_body, inquiry
  end
  private
  def inquiry
    MovingInquiry.first
  end
  def response_body
    show_received_inquiry_response(inquiry)
  end
end
