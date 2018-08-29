# frozen_string_literal: true

class InquiryDeliveryWorker
  include Sneakers::Worker
  from_queue :inquiries,
             handler: Sneakers::Handlers::Maxretry,
             retry_routing_key: 'inquiries',
             arguments: { 'x-dead-letter-exchange': 'activejob-retry' },
             timeout_job_after: 2.minutes,
             ack: true

  def work(msg)
    inquiry = inquiry(msg)
    inquiry_delivery = MovuTransceiver.new(inquiry)
    inquiry_delivery.post
    inquiry_delivery.received
    warn '❕Transceived❕ ✅'
    ack!
  rescue
    reject!
  end

  private

  def inquiry(msg)
    message = JSON.parse(msg)
    klass = message['inquiry_name'].classify.safe_constantize
    klass.find(message['inquiry_id'])
  end
end
