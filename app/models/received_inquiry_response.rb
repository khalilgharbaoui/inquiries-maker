class ReceivedInquiryResponse < ApplicationRecord
  belongs_to :moving_iquiry, optional: true
  belongs_to :cleaning_iquiry, optional: true
  belongs_to :combined_iquiry, optional: true
  before_save ResponseBodyWrapper.new
  after_create :schedule_client_emails(self)

  def schedule_client_emails
    ClientMailer.client(self).deliver_later
  end
end
