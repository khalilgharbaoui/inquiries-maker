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

FactoryBot.define do
  factory :invoice do
    quarter { "MyString" }
    representation { "MyString" }
  end
end
