# frozen_string_literal: true

class ReceivedInquiryResponse < ApplicationRecord
  belongs_to :moving_inquiry, optional: true
  belongs_to :cleaning_inquiry, optional: true
  belongs_to :combined_inquiry, optional: true
  belongs_to :invoice, class_name: 'Invoice', foreign_key: 'quarter',
                       primary_key: 'quarter', optional: true, inverse_of: :inquiries
  before_save ResponseBodyWrapper.new
  before_create :set_quarter
  after_commit :send_telegram_notification, on: :create

  private

  def set_quarter
    self.quarter = "Q#{Date.parse(created_at.to_s).quarter} #{Date.parse(created_at.to_s).year}"
  end

  def send_telegram_notification
    Rails.env.to_sym == :production ? TelegramNotifier.new(self) : warn("ℹ️  #{self.class.name} => ##{id}")
  end
end
