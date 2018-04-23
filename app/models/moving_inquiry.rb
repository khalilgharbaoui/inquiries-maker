class MovingInquiry < ApplicationRecord

  validates :locale, :is_moving_request, :is_cleaning_request,
            :client_salutation, :client_first_name, :client_last_name, :client_email, :client_mobile, :client_postal_code, :moving_postal_code, :client_property_size, exclusion: { in: [nil] }

  validates :locale, :client_salutation, :client_first_name,
            :client_last_name, :client_postal_code,:moving_postal_code,  :client_property_size, presence: true

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


end
