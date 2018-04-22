class CreateCombinedInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :combined_inquiries do |t|
      t.string :partner_token
      t.string :locale, null: false, default: :de
      t.string :client_first_name
      t.string :client_last_name
      t.string :client_salutation
      t.string :client_email
      t.string :client_mobile
      t.string :client_street_and_number
      t.string :client_postal_code
      t.string :client_property_size
      t.boolean :is_moving_request, null: false, default: true
      t.boolean :is_cleaning_request, null: false, default: true
      t.string :moving_street_and_number
      t.string :moving_postal_code
      t.date :moving_date
      t.date :cleaning_date

      t.timestamps
    end
  end
end
