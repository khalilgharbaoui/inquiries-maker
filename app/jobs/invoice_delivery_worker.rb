# frozen_string_literal: true

class InvoiceDeliveryWorker
  include Sneakers::Worker
  from_queue :invoices,
             handler: Sneakers::Handlers::Maxretry,
             retry_routing_key: 'invoices',
             arguments: { 'x-dead-letter-exchange': 'activejob-retry' },
             timeout_job_after: 60.seconds,
             ack: true

  def work(msg)
    inquiries = ReceivedInquiryResponse.where('quarter = ?', msg)
    worker_trace "FOUND <#{inquiries.first.quarter}>"
    update_or_create_invoice(msg)
    worker_trace "SAVED <#{inquiries.first.quarter}>"
    InvoiceMailer.invoice(inquiries).deliver
    worker_trace "SENT <#{inquiries.first.quarter}>"
    warn "#{inquiries.count} in invoice #{inquiries.first.quarter} sent & saved!✅"
    ack!
  rescue
    reject!
  end

  private

  def update_or_create_invoice(msg)
    invoice_record = if Invoice.find_by(quarter: msg).present?
      invoice = Invoice.find_by(quarter: msg)
      invoice.send_count += 1
      invoice
    else
      Invoice.new(quarter: msg, representation: "/invoices/#{msg}.pdf?debug=true", send_count: 1)
    end
    invoice_record.save!(touch: true)
  end
end
