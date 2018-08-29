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
    InvoiceMailer.invoice(inquiries).deliver
    worker_trace "SENT <#{inquiries.first.quarter}>"
    warn "#{inquiries.count} in invoice #{inquiries.first.quarter} ✅"
    ack!
  rescue
    reject!
  end
end
