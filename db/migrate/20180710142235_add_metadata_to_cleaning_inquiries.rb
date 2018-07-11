class AddMetadataToCleaningInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :cleaning_inquiries, :origin, :string
    add_column :cleaning_inquiries, :hostname, :string
    add_column :cleaning_inquiries, :path, :string
    add_column :cleaning_inquiries, :referrer, :string
    add_column :cleaning_inquiries, :ip, :string
  end
end
