# frozen_string_literal: true.

class Invoice < ApplicationRecord
  has_many :inquiries, class_name: 'ReceivedInquiryResponse',
                       primary_key: 'quarter', foreign_key: 'quarter',
                       inverse_of: :invoice
end
