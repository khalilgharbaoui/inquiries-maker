class InvoiceDeliveryJob < ApplicationJob
  queue_as :invoices

  def perform(quarter)
    inquiries = ReceivedInquiryResponse.order("id DESC").where('quarter = ?', quarter)
    InvoiceMailer.invoice(inquiries).deliver
  end
end
