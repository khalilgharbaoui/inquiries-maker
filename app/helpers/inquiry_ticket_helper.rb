module InquiryTicketHelper
  def ticket(response_body)
    "USR##{response_body.dig(:user_id)}-INQ##{response_body.dig(:id)}"
  end
end
