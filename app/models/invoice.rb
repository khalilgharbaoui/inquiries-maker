class Invoice < ApplicationRecord
  has_many :inquiries, class_name: 'ReceivedInquiryResponse',
                       primary_key: 'quarter', foreign_key: 'quarter'
end
