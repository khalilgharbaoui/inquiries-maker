class ApplicationController < ActionController::Base
  before_action :set_locale
  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = extract_from_params_or_language_header
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
  # def default_url_options
  #   { locale: I18n.locale }
  # end
  # if current_admin_user
  #    I18n.locale = :en #or better: default_locale
  # else
  #    #Your logic
  # end
  #
  # if current_user.is_admin?
  #    I18n.locale = :en #or better: default_locale
  # else
  #    #Your logic
  # end
  #
  # if self.kind_of? ActiveAdmin::BaseController
  #    I18n.locale = :en
  # else
  #  #Your logic
  # end
  private
  def extract_from_params_or_language_header
    extract_from_params || extract_from_language_header
  end
  def extract_from_params
    params[:locale]
  end
  def extract_from_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
