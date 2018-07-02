class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  include LocaleFromBrowserConcern

  # TODO: Add method to set admin locale to :en
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
end
