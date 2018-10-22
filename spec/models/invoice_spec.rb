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

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
