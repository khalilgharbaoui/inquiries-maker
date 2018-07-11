class AddMetadataToMovingInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :moving_inquiries, :origin, :string
    add_column :moving_inquiries, :hostname, :string
    add_column :moving_inquiries, :path, :string
    add_column :moving_inquiries, :referrer, :string
    add_column :moving_inquiries, :ip, :string
  end
end
