# frozen_string_literal: true

class ReceivedInquiryResponse < ApplicationRecord
  belongs_to :moving_inquiry, optional: true
  belongs_to :cleaning_inquiry, optional: true
  belongs_to :combined_inquiry, optional: true
  before_save ResponseBodyWrapper.new
  after_save :schedule_client_emails
  private

  def schedule_client_emails
    _reflections.each do |inquiry, _|
      next unless send(:"#{inquiry}_id?")
      ClientMailer.client(
        response_body.transform_keys!(&:to_sym),
        send(:"#{inquiry}")
      ).deliver
    end
  end
end
