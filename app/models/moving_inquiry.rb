class MovingInquiry < ApplicationRecord
  validates :locale, :is_moving_request, :is_cleaning_request,
            :client_salutation, :client_first_name, :client_last_name, :client_email, :client_mobile, :client_postal_code, :client_city, :moving_postal_code, :moving_city, :moving_date, :client_property_size, :client_street_and_number, :moving_street_and_number, exclusion: { in: [nil] }

  validates :locale, :client_salutation, :client_first_name,
            :client_last_name, :client_postal_code,:moving_postal_code, :client_city, :moving_city, :client_property_size, :client_street_and_number, :moving_street_and_number, presence: true

  validates :locale, inclusion: { in: %w[de en fr]}
  validates :client_salutation, inclusion: { in: %w[Mr Mrs Herr Frau M. Mme]}
  validates :client_property_size, inclusion: { in: %w[size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8]}

  validates :is_moving_request, inclusion: { in: [true, false] }
  validates :is_moving_request, inclusion: { in: [true] }

  validates :is_cleaning_request, inclusion: { in: [true, false] }
  validates :is_cleaning_request, inclusion: { in: [false] }

  validates :client_email, presence: true, 'valid_email_2/email':  { mx: true, disposable: true, disallow_subaddressing: false}

  validates :client_mobile, phone: {possible: true, allow_blank: false, types: [:fixed_or_mobile,:fixed_line, :mobile]}

  validates :client_postal_code, :moving_postal_code, zipcode: { country_code: :ch }
  validates_format_of :moving_date, with: /\d{4}\-\d{2}\-\d{2}/, message: "^Date must be in the following format: yyyy-mm-yy"
  validates :client_street_and_number, :moving_street_and_number, length: { minimum: 3 }
  validates :client_street_and_number, :moving_street_and_number, format: { with: /\d+/,
  message: "Must contain a home number" }
end
