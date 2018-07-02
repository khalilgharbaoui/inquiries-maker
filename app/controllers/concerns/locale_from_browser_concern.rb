# frozen_string_literal: true

module LocaleFromBrowserConcern
  # This make the browser language stick from the first session onward.
  # it is now still possible to change the language using the language switcher helper
  # but now the default language for the current session is from the browser HTTP_ACCEPT_LANGUAGE
  extend ActiveSupport::Concern

  included do
    if respond_to?(:prepend_before_action)
      prepend_before_action :set_locale_from_browser
    end
  end
  private

  def set_locale_from_browser(*)
    if session[:initialized].nil? || !session[:initialized]
      pp "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
      params[:locale] = I18n.locale
      logger.debug "* ✅ Set locale to '#{I18n.locale}' and params to #{params[:locale]}"
    else
      logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
      logger.debug "* ♻️ Already set to '#{I18n.locale}'"
    end
    I18n.locale = params[:locale]
    session[:initialized] = true
    params[:locale] = I18n.locale # set the url to match displayed language
  end
end
