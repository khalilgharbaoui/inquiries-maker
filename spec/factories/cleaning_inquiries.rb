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
