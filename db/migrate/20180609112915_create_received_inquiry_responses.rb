class CreateReceivedInquiryResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :received_inquiry_responses do |t|
      t.references :moving_inquiry, foreign_key: true
      t.references :cleaning_inquiry, foreign_key: true
      t.references :combined_inquiry, foreign_key: true
      t.jsonb :response_body, index: true, default: {}, null: false

      t.timestamps
    end
  end
end
