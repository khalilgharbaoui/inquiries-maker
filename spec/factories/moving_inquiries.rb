FactoryBot.define do
  factory :moving_inquiry do
    partner_token "MyString"
    locale { Faker::SwissLocals.locale }
    client_salutation "Mr"
    # client_salutation { Faker::salutations.de || Faker::salutations.en || Faker::salutations.fr}
    client_first_name { Faker::Name.first_name }
    client_last_name { Faker::Name.first_name }
    client_email { Faker::Internet.email }
    client_mobile { Faker::PhoneNumber.phone_number }
    client_street_and_number { Faker::Address.street_name + " " + Faker::Address.building_number}
    client_postal_code { Faker::Address.postcode }
    client_property_size "Size_1"
    is_moving_request false
    is_cleaning_request false
    moving_street_and_number "MyString"
    moving_postal_code "MyString"
    moving_date "2018-04-21"
  end
end
