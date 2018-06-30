module InquiryTicketHelper
  def ticket(response_body)
    "USR##{response_body[:user_id]}-INQ##{response_body[:id]}"
  end
end
