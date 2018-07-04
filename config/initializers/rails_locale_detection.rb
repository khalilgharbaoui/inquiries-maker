RailsLocaleDetection.config do |config|
  config.locale_expiry = 6.months
  config.set_default_url_option = :always
  config.detection_order = [:param, :user, :cookie, :request]
  config.automatically_detect = true
  config.locale_key = :locale
end
