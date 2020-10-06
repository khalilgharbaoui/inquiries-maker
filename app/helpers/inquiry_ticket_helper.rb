module InquiryTicketHelper
  def ticket(response_body)
    "USR##{response_body.dig_deep(:user_id)}-INQ##{id_from_response_body(response_body)}"
  end
  
  def id_from_response_body(response_body)
    result = response_body.dig_deep(:id)
    result.respond_to?(:count) && result.count == 2 ? result.first : result
  end
end
