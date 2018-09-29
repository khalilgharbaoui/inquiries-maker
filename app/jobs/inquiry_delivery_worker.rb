# frozen_string_literal: true

class InquiryDeliveryWorker
  include Sneakers::Worker
  from_queue :inquiries,
             handler: Sneakers::Handlers::Maxretry,
             retry_routing_key: 'inquiries',
             arguments: { 'x-dead-letter-exchange': 'activejob-retry' },
             timeout_job_after: 60.seconds, # Maximal seconds to wait for job
             ack: true

  def work(msg)
    warn "🔮 #{msg} 🔮"
    deliver_inquiry(msg)
    warn '✅ Transceived Inquiry❕'
    deliver_client_email(msg)
    warn '✅ Deliverd Email❕'
    ack!
  rescue
    reject!
  end

  private

  def deliver_inquiry(msg)
    inquiry = inquiry(msg)
    MovuTransceiver.transceive(inquiry)
  end

  def deliver_client_email(msg)
    response = inquiry(msg).received_inquiry_response
    ClientMailer.client(
      response.response_body.transform_keys!(&:to_sym),
      inquiry(msg)
    ).deliver
  end

  def inquiry(msg)
    inquiry_type = JSON.parse(msg)['inquiry_name'].constantize
    inquiry_type.find(JSON.parse(msg)['inquiry_id'])
  end
end
