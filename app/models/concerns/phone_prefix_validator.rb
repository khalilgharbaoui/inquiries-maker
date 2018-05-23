class PhonePrefixValidator < ActiveModel::Validator
  def validate(record)
    options[:fields].any? do |field|
      phone_number = record.send(field).to_s
      unless phone_number.start_with?("+417","07","00417")
          record.errors.add(field, "#{phone_number} should begin with '+417' or '00417' or '07' Mobile / Natel Only!!")
      end
    end
  end
end
