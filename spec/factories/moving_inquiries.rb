FactoryBot.define do
  factory :moving_inquiry do
    partner_token "MyString"
    locale "de"
    client_salutation "loo"
    client_first_name "MyString"
    client_last_name "MyString"
    client_email "MyString"
    client_mobile "MyString"
    client_street_and_number "MyString"
    client_postal_code "MyString"
    client_property_size "MyString"
    is_moving_request false
    is_cleaning_request false
    moving_street_and_number "MyString"
    moving_postal_code "MyString"
    moving_date "2018-04-21"
  end
end
