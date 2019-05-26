# frozen_string_literal: true

# == Schema Information
#
# Table name: moving_inquiries
#
#  id                       :bigint(8)        not null, primary key
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
#  is_cleaning_request      :boolean          default(FALSE), not null
#  is_moving_request        :boolean          default(TRUE), not null
#  locale                   :string           default("de"), not null
#  moving_city              :string
#  moving_date              :date
#  moving_postal_code       :string
#  moving_street_and_number :string
#  origin                   :string
#  partner_token            :string
#  path                     :string
#  referrer                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

FactoryBot.define do
  factory :moving_inquiry do
    # TODO: FIX THIS:
    locale { Faker::SwissLocals.locale }
    is_moving_request { true }
    is_cleaning_request { false }
    # client_salutation { Faker::SwissLocals.random_salutations }
    client_salutation { Faker::SwissLocals.salutations('de') } # de en fr
    client_first_name { Faker::Name.first_name }
    client_last_name { Faker::Name.last_name }
    client_email { Faker::Internet.email }
    client_mobile { Faker::PhoneNumber.cell_phone }
    client_street_and_number { Faker::Address.street_name + ' ' + Faker::Address.building_number }
    client_postal_code { Faker::Address.postcode }
    client_city { Faker::Address.city }
    client_property_size { %w[size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8].sample }
    moving_street_and_number { Faker::Address.street_name + ' ' + Faker::Address.building_number }
    moving_postal_code { Faker::Address.postcode }
    moving_city { Faker::Address.city }
    moving_date { Faker::Date.forward(days = 365) }
  end
end
