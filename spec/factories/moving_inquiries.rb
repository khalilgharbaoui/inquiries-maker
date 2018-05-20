FactoryBot.define do
  factory :moving_inquiry do
    #TODO: FIX THIS:
    locale { Faker::SwissLocals.locale }
    client_salutation { Faker::SwissLocals.random_salutations }
    # client_salutation { Faker::SwissLocals.salutations("fr") } # de en fr
    is_moving_request true
    is_cleaning_request false

    client_first_name { Faker::Name.first_name }
    client_last_name { Faker::Name.last_name }

    client_email { Faker::Internet.email }
    client_mobile { Faker::PhoneNumber.phone_number }
    client_street_and_number { Faker::Address.street_name + " " + Faker::Address.building_number}

    client_postal_code { Faker::Address.postcode }
    client_city { Faker::Address.city }
    client_property_size ["size_1", "size_2", "size_3", "size_4", "size_5", "size_6", "size_7", "size_8"].shuffle.first

    moving_street_and_number { Faker::Address.street_name + " " + Faker::Address.building_number}
    moving_postal_code { Faker::Address.postcode }
    moving_city { Faker::Address.city }
    moving_date {Faker::Date.forward(days = 365)}
  end
end
