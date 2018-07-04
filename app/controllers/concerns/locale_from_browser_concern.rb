# frozen_string_literal: true

module LocaleFromBrowserConcern
  # This makes the initial user preferred browser language stick from the first session onward now!
  # It's is now still possible to change the language using the language switcher helper,
  # for subsequent session. and even those stick after a reload now.
  # But now the FIRST language for the current cookie is from the browser HTTP_ACCEPT_LANGUAGE

  # this is now dependent on 'rails_locale_detection' with a specific configuration in the initializer!
  extend ActiveSupport::Concern

  included do
    if respond_to?(:prepend_before_action)
      prepend_before_action :set_locale_from_browser
    end
  end
  private

  def set_locale_from_browser
    from_browser_header = http_accept_language.compatible_language_from(I18n.available_locales)
    if cookies[:locale].nil? || !cookies[:locale] || session[:initialized].nil? || !session[:initialized]
      logger.debug "* Accept-Language: #{http_accept_language.user_preferred_languages}"
      cookies[:locale] = from_browser_header
      params[:locale] = from_browser_header
      I18n.locale = from_browser_header
      logger.debug "* Initial ✅ I18n: '#{I18n.locale}', params: '#{params[:locale]}', cookies: '#{cookies[:locale]}'"
    else
      logger.debug "* Accept-Language: #{http_accept_language.user_preferred_languages}"
      logger.debug "* Subsequent ♻️ set I18n: '#{I18n.locale}', params: '#{params[:locale]}', cookies: '#{cookies[:locale]}'"
    end
    I18n.locale = params[:locale]
    session[:initialized] = true
  end
end
