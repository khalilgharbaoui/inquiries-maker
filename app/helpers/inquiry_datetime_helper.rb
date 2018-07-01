module InquiryDatetimeHelper
  def inquiry_conclusion_date(inquiry)
    inquiry_type = inquiry.class.name.underscore.split("_")[0]
    inquiry_type == 'combined' ? (conclusion_date = inquiry.send :"moving_date") : (conclusion_date = inquiry.send :"#{inquiry_type}_date")
    return conclusion_date.to_s(:swiss_date_format)
  end
  def inquiry_creation_date(inquiry)
    return inquiry.created_at.to_s(:swiss_date_format)
  end
  def inquiry_creation_time(inquiry)
    return inquiry.created_at.to_s(:custom_time)
  end
end
