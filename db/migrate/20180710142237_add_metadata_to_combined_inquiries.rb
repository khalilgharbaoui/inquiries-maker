class AddMetadataToCombinedInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :combined_inquiries, :origin, :string
    add_column :combined_inquiries, :hostname, :string
    add_column :combined_inquiries, :path, :string
    add_column :combined_inquiries, :referrer, :string
    add_column :combined_inquiries, :ip, :string
  end
end
