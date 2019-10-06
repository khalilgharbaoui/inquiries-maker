# frozen_string_literal: true.

# == Schema Information
#
# Table name: invoices
#
#  id             :bigint(8)        not null, primary key
#  quarter        :string
#  representation :string
#  send_count     :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Invoice < ApplicationRecord
  has_many :inquiries, class_name: 'ReceivedInquiryResponse',
                       primary_key: 'quarter', foreign_key: 'quarter',
                       inverse_of: :invoice
end
