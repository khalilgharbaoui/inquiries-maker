module ParentThankYouPageUrlMaker
  def parent_thank_you_page_url
    return "#{url}/#{locale}/#{t(thank_you_path)}/"
  end

private

  def locale
    I18n.locale
  end

  def inquiry_type
    params[:controller].split("_").first
  end

  def url
    instance_variable_get("@#{inquiry_type}_inquiry").origin
  end

  def thank_you_path
    "thank_you_#{inquiry_type}"
  end
end
