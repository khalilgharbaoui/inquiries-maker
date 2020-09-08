class ChangeForeignKey < ActiveRecord::Migration[5.2]
  def change
    # remove the old foreign_key
    remove_foreign_key 'received_inquiry_responses', 'cleaning_inquiries'
    remove_foreign_key 'received_inquiry_responses', 'combined_inquiries'
    remove_foreign_key 'received_inquiry_responses', 'moving_inquiries'

    # add the new foreign_key
    add_foreign_key 'received_inquiry_responses', 'cleaning_inquiries', on_delete: :cascade
    add_foreign_key 'received_inquiry_responses', 'combined_inquiries', on_delete: :cascade
    add_foreign_key 'received_inquiry_responses', 'moving_inquiries', on_delete: :cascade
  end
end
