class MovingInquiry < ApplicationRecord
  enum client_property_size: {size_1: "size_1", size_2: "size_2", size_3: "size_3", size_4: "size_4", size_5: "size_5", size_6: "size_6", size_7: "size_7", size_8: "size_8"}
  CH = Phonelib.default_country
  before_save PhoneNumberWrapper.new

  validates :locale, :is_moving_request, :is_cleaning_request,
            :client_salutation, :client_first_name, :client_last_name, :client_email, :client_mobile, :client_postal_code, :client_city, :moving_postal_code, :moving_city, :moving_date, :client_property_size, :client_street_and_number, :moving_street_and_number, exclusion: { in: [nil] }

  validates :locale, :client_salutation, :client_first_name,
            :client_last_name, :client_postal_code,:moving_postal_code, :client_city, :moving_city, :client_property_size, :client_street_and_number, :moving_street_and_number, presence: true

  validates :locale, inclusion: { in: %w[de en fr]}
  validates :client_salutation, inclusion: { in: %w[mr ms]}
  validates :client_property_size, inclusion: { in: %w(size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8)}

  validates :is_moving_request, inclusion: { in: [true, false] }
  validates :is_moving_request, inclusion: { in: [true] }

  validates :is_cleaning_request, inclusion: { in: [true, false] }
  validates :is_cleaning_request, inclusion: { in: [false] }

  validates :client_email, presence: true, 'valid_email_2/email':  { mx: true, disposable: true, disallow_subaddressing: false}

  validates :client_mobile, phone: {possible: true, allow_blank: false, types: [:mobile]}

  validates :client_mobile, phone: { countries: [CH], types: [:mobile], message: "only swiss mobiles"}

  # validates_with PhoneCountryCodeValidator, fields: [:client_mobile], country_codes: ["CH", :ch, Phonelib.default_country]

  validates_format_of :client_mobile, with: /(\A07|\A.417|\A00417)/,message: "07, 00417 orsize_ 417"

  validates :client_postal_code, :moving_postal_code, zipcode: { country_code: :ch }
  validates_format_of :moving_date, with: /\d{4}\-\d{2}\-\d{2}/, message: "^Date must be in the following format: yyyy-mm-yy"
  validates :client_street_and_number, :moving_street_and_number, length: { minimum: 3 }
  validates :client_street_and_number, :moving_street_and_number, format: { with: /\d+/,
  message: "Must contain a home number" }

  after_create :schedule_client_emails

  private
  def schedule_client_emails
    # ClientMailer.client(self).deliver_later

    MovingInquiryPostingJob.perform_later(self.id)
  end
end
