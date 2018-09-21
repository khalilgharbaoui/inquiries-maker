class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :quarter
      t.integer :send_count, default: 0, null: false
      t.string :representation

      t.timestamps
    end
  end
end
