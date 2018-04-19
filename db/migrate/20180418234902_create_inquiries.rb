class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :kind
      t.boolean :is_moving_request
      t.boolean :is_cleaning_request
      t.string :client_salutation
      t.string :client_sex
      t.string :client_first_name
      t.string :client_last_name
      t.string :client_email
      t.string :client_mobile
      t.string :client_street_and_number
      t.string :client_postal_code
      t.string :client_city
      t.string :client_property_size
      t.date :moving_date
      t.date :cleaning_date
      t.string :moving_street_and_number
      t.string :moving_postal_code
      t.string :moving_city
      t.string :authorization_token
      t.string :status
      t.string :flow_status
      t.string :continue_url

      t.timestamps
    end
  end
end
