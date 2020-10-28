module Deliverable
  extend ActiveSupport::Concern

  included do
    after_commit :schedule_inquiry_delivery, on: :create
  end

  def schedule_inquiry_delivery
    msg = { inquiry_name: self.class.name, inquiry_id: id }.to_json
    InquiryDeliveryWorker.enqueue(msg) unless client_email == Cre.dig(:gmail_username)
  end
end
