module ParentThankYouPageUrlMaker
  def parent_thank_you_page
    locale = I18n.locale
    url = Rails.application.credentials.dig(Rails.env.to_sym, :uos_url)
    caller_class_name = caller.first.split("/").pop.split(".rb").first
    inquiry_type = caller_class_name.split("_").first
    thank_you_path = "thank_you_#{inquiry_type}"
    return "#{url}/#{locale}/#{t(thank_you_path)}/"
  end
end
