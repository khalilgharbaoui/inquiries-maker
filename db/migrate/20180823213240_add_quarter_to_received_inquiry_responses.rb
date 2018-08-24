class AddQuarterToReceivedInquiryResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :received_inquiry_responses, :quarter, :string
  end
end
