# frozen_string_literal: true

class InvoiceMailerPreview
  include ApplicationHelper
  def invoice
    InvoiceMailer.invoice inquiries
  end

  private

  def inquiries
    ReceivedInquiryResponse.where('quarter = ?', 'Q3 2018')
  end
end
