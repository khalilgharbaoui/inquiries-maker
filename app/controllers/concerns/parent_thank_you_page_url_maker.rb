module ParentThankYouPageUrlMaker
  def parent_thank_you_page_url
      locale = I18n.locale
      inquiry_type = params[:controller].split("_").first
      url = instance_variable_get("@#{inquiry_type}_inquiry").origin
      thank_you_path = "thank_you_#{inquiry_type}"
      return "#{url}/#{locale}/#{t(thank_you_path)}/"
  end
end
