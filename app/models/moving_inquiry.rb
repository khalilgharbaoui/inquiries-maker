class MovingInquiry < ApplicationRecord
  validates :locale, :is_moving_request, :is_cleaning_request,
            :client_salutation, :client_first_name, :client_last_name, exclusion: { in: [nil] }

  validates :locale, inclusion: { in: %w[de en fr]}

  validates :client_salutation, inclusion: { in: %w[Mr Mrs Herr Frau M. Mme]}

  validates :is_moving_request, inclusion: { in: [true, false] }
  validates :is_moving_request, inclusion: { in: [true] }

  validates :is_cleaning_request, inclusion: { in: [true, false] }
  validates :is_cleaning_request, inclusion: { in: [false] }

  validates :client_first_name, :client_last_name, presence: true

end
