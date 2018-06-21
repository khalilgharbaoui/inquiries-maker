class ReceivedInquiryResponse < ApplicationRecord
  belongs_to :moving_iquiry, optional: true
  belongs_to :cleaning_iquiry, optional: true
  belongs_to :combined_iquiry, optional: true
  # after_create :schedule_client_emails
end
