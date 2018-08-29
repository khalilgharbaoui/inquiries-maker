# frozen_string_literal: true

# custom date and time and datetime formats

Date::DATE_FORMATS[:swiss_date_format] = '%d.%m.%Y'
Date::DATE_FORMATS[:custom_time] = '%H:%M'

DateTime::DATE_FORMATS[:swiss_date_format] = '%d.%m.%Y'
DateTime::DATE_FORMATS[:custom_time] = '%H:%M'

Time::DATE_FORMATS[:swiss_date_format] = '%d.%m.%Y'
Time::DATE_FORMATS[:custom_time] = '%H:%M'

# extend Date with quarter
class Date
  def quarter
    (month / 3.0).ceil
  end
end
