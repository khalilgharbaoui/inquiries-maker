class PhoneNumberWrapper
  def before_save(record)
    record.client_mobile = internationalize(record.client_mobile)
  end

  private
    def nationalize(value)
      # 07xxxxxxxx
      Phonelib.parse(value).national(false)
    end
    def internationalize(value)
      # +417xxxxxxxxx
      Phonelib.parse(value).full_e164
    end
end
