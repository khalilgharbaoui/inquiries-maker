# frozen_string_literal: true

# == Schema Information
#
# Table name: received_inquiry_responses
#
#  id                  :bigint(8)        not null, primary key
#  quarter             :string
#  response_body       :jsonb            not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  cleaning_inquiry_id :bigint(8)
#  combined_inquiry_id :bigint(8)
#  moving_inquiry_id   :bigint(8)
#
# Indexes
#
#  index_received_inquiry_responses_on_cleaning_inquiry_id  (cleaning_inquiry_id)
#  index_received_inquiry_responses_on_combined_inquiry_id  (combined_inquiry_id)
#  index_received_inquiry_responses_on_moving_inquiry_id    (moving_inquiry_id)
#  index_received_inquiry_responses_on_response_body        (response_body)
#
# Foreign Keys
#
#  fk_rails_...  (cleaning_inquiry_id => cleaning_inquiries.id)
#  fk_rails_...  (combined_inquiry_id => combined_inquiries.id)
#  fk_rails_...  (moving_inquiry_id => moving_inquiries.id)
#


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
