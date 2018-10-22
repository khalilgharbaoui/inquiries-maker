# == Schema Information
#
# Table name: cleaning_inquiries
#
#  id                       :bigint(8)        not null, primary key
#  cleaning_date            :date
#  client_city              :string
#  client_email             :string
#  client_first_name        :string
#  client_last_name         :string
#  client_mobile            :string
#  client_postal_code       :string
#  client_property_size     :string
#  client_salutation        :string
#  client_street_and_number :string
#  hostname                 :string
#  ip                       :string
#  is_cleaning_request      :boolean          default(TRUE), not null
#  is_moving_request        :boolean          default(FALSE), not null
#  locale                   :string           default("de"), not null
#  origin                   :string
#  partner_token            :string
#  path                     :string
#  referrer                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

FactoryBot.define do
  factory :cleaning_inquiry do
    #TODO: FIX THIS:
    locale { Faker::SwissLocals.locale }
    is_moving_request false
    is_cleaning_request true
    # client_salutation { Faker::SwissLocals.random_salutations }
    client_salutation { Faker::SwissLocals.salutations("de") } # de en fr
    client_first_name { Faker::Name.first_name }
    client_last_name { Faker::Name.last_name }
    client_email { Faker::Internet.email }
    client_mobile { Faker::PhoneNumber.cell_phone }
    client_street_and_number { Faker::Address.street_name + " " + Faker::Address.building_number}
    client_postal_code { Faker::Address.postcode }
    client_city { Faker::Address.city }
    client_property_size ["size_1", "size_2", "size_3", "size_4", "size_5", "size_6", "size_7", "size_8"].shuffle.first
    cleaning_date {Faker::Date.forward(days = 365)}
  end
end
