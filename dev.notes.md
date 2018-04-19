#### example of the structure
```
{
  "id": 1,
  "kind": "combined",
  "is_moving_request": true,
  "is_cleaning_request": true,
  "client_salutation": "mr",
  "client_sex": "male",
  "client_first_name": "Chuck",
  "client_last_name": "Norris",
  "client_email": "chuck@norris.com",
  "client_mobile": "0766666666",
  "client_street_and_number": "Teststrasse 18",
  "client_postal_code": "8006",
  "client_city": "Zurich",
  "client_property_size": "size_4",
  "moving_date": "2015-07-20",
  "cleaning_date": "2015-07-21",
  "moving_street_and_number": "Partystrasse 13",
  "moving_postal_code": "8051",
  "moving_city": "Zurich",
  "authorization_token": "98e7aea9c80c4ff05b79bfd80cec8352",
  "status": "inquiry_submitted",
  "flow_status": "step_2",
  "continue_url": "https://www.movu.ch/en/inquiries?utm_campaign=JavaScript-Form&utm_medium=affiliate#inquiries/98e7aea9c80c4ff05b79bfd80cec8352/steps/step_2"
}

```

#### initial scaffold
rails generate scaffold Inquiry kind:string is_moving_request:boolean is_cleaning_request:boolean client_salutation:string client_sex:string client_first_name:string client_last_name:string client_email:string client_mobile:string client_street_and_number:string client_postal_code:string client_city:string client_property_size:string moving_date:date cleaning_date:date moving_street_and_number:string moving_postal_code:string moving_city:string authorization_token:string status:string flow_status:string continue_url:string

#### raw rails types
:primary_key, :string, :text, :integer, :float, :decimal, :datetime, :timestamp,
:time, :date, :binary, :boolean, :references
