class MovingInquiry < ApplicationRecord
  validates :client_salutation, :inclusion => { :in => ["Mr", "Mrs"] }
end
