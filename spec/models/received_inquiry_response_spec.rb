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

require 'rails_helper'

RSpec.describe ReceivedInquiryResponse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
