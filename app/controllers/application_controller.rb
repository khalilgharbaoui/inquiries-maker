class ApplicationController < ActionController::Base
  before_action :set_locale, only: [:new, :create]

  before_action :set_locale

def set_locale
  I18n.locale = params[:locale] || extract_locale_from_accept_language_header
end

def default_url_options
  { locale: I18n.locale }
end

  # if current_admin_user
  #    I18n.locale = :en #or better: default_locale
  # else
  #    #Your logic
  # end

  # if current_user.is_admin?
  #    I18n.locale = :en #or better: default_locale
  # else
  #    #Your logic
  # end

  # if self.kind_of? ActiveAdmin::BaseController
  #    I18n.locale = :en
  # else
  #  #Your logic
  # end

  #TODO: COVER MORE LANGUAGE CODES!
  def extract_locale_from_accept_language_header
    if %w[de fr en].include?(request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first)
      return request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    elsif %w[de fr en].include?(!request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first)
      return 'en'
    else
      return I18n.default_locale
    end
  end
end
