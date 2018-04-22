json.extract! cleaning_inquiry, :id, :partner_token, :locale, :client_first_name, :client_last_name, :client_salutation, :client_email, :client_mobile, :client_street_and_number, :client_postal_code, :client_property_size, :is_moving_request, :is_cleaning_request, :cleaning_date, :created_at, :updated_at
json.url cleaning_inquiry_url(cleaning_inquiry, format: :json)
