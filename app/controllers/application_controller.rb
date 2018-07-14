# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  include LocaleFromBrowser

  def user_locale
    current_user.locale if current_user
  end
end
