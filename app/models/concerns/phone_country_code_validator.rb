class PhoneCountryCodeValidator < ActiveModel::Validator
  def validate(record)
    options[:fields].any? do |field|
      phone_number = record.send(field)
      phone_country = Phonelib.parse(phone_number).country
      phone_country_code = phone_country.to_s.upcase

      options[:country_codes].any? do |valid_country|
        valid_country_code = valid_country.to_s.upcase
        unless phone_country_code == valid_country_code
          record.errors.add(field, "has an invalid country code: #{phone_country_code} should be #{valid_country_code}")
        end
      end
    end
  end
end
