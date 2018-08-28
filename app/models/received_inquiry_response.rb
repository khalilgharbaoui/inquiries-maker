# frozen_string_literal: true

class ReceivedInquiryResponse < ApplicationRecord
  belongs_to :moving_inquiry, optional: true
  belongs_to :cleaning_inquiry, optional: true
  belongs_to :combined_inquiry, optional: true
  before_save ResponseBodyWrapper.new
  before_create :set_quarter
  after_commit :schedule_client_emails, on: :create
  after_commit :send_telegram_notification, on: :create

  private

  def set_quarter
      self.quarter = "Q#{Date.parse(created_at.to_s).quarter} #{Date.parse(created_at.to_s).year}"
  end

  def send_telegram_notification
    Rails.env.to_sym == :production ? TelegramNotifier.new(self) : $stderr.puts "#{Time.now} ##{self.id} ✅"
  end

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
