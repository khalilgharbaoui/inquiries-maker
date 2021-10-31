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
    inquiry = inquiry(msg)
    warn "🔮 #{inquiry.class.name} => #{inquiry.id} ❕"
    raise 'Existing Response!' if received_inquiry_response_exists?(inquiry)

    response = MovuTransceiver.transceive(inquiry)
    # ResponseLogger.log(response)
    warn "🔵 Transceived #{inquiry.class.name} => #{inquiry.id}❕"
    save_received_response(response, inquiry)
    warn "🆗 Saved Received #{inquiry.class.name} Response => #{inquiry.id}❕"
    send_client_email(inquiry)
    warn "✅ Sent #{inquiry.class.name} Client Email => #{inquiry.id}❕"
    ack!
  rescue Exception => e
    warn "🛑 #{([e.inspect]+e.backtrace).join($/)}"
    Raven.capture_exception(e)
    reject!
  end

  private

  def received_inquiry_response_exists?(inquiry)
    ReceivedInquiryResponse.where(:"#{inquiry.class.name.underscore}_id" =>  inquiry.id).any?
  end

  def save_received_response(response, inquiry)
      ReceivedInquiryResponse.create!(
        :"#{inquiry.class.name.underscore}_id" =>  inquiry.id,
        :response_body => response.body
      )
  end

  def send_client_email(inquiry)
    ClientMailer.client(
      inquiry.received_inquiry_response.response_body.transform_keys!(&:to_sym),
      inquiry
    ).deliver
  end

  def inquiry(msg)
    inquiry_type = JSON.parse(msg)['inquiry_name'].constantize
    inquiry_type.find(JSON.parse(msg)['inquiry_id'])
  end
end
