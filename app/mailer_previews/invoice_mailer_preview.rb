# frozen_string_literal: true

class InvoiceMailerPreview
  include ApplicationHelper
  def invoice
    InvoiceMailer.invoice inquiries
  end

  private

  def inquiries
    responses_grouped_by_quarter = ReceivedInquiryResponse.all.group_by(&:quarter)
    last_quarter = ReceivedInquiryResponse.last.quarter
    responses_grouped_by_quarter[last_quarter]
  end
end
