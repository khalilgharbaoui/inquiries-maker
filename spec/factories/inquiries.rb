FactoryBot.define do
  factory :inquiry do
    kind "MyString"
    is_moving_request false
    is_cleaning_request false
    client_salutation "MyString"
    client_sex "MyString"
    client_first_name "MyString"
    client_last_name "MyString"
    client_email "MyString"
    client_mobile "MyString"
    client_street_and_number "MyString"
    client_postal_code "MyString"
    client_city "MyString"
    client_property_size "MyString"
    moving_date "2018-04-19"
    cleaning_date "2018-04-19"
    moving_street_and_number "MyString"
    moving_postal_code "MyString"
    moving_city "MyString"
    authorization_token "MyString"
    status "MyString"
    flow_status "MyString"
    continue_url "MyString"
  end
end
