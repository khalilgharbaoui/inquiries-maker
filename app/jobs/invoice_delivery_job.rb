# frozen_string_literal: true

class InvoiceDeliveryJob < ApplicationJob
  queue_as :default

  def perform(quarter)
    InvoiceMailer.invoice(ReceivedInquiryResponse.where('quarter = ?', quarter)).deliver
  end
end
