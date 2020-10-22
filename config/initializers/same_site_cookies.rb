# frozen_string_literal: true

class SameSiteCookies
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    set_cookie_header = headers['Set-Cookie']

    if set_cookie_header && !(set_cookie_header =~ /SameSite\=/)
      # the set cookie header variable is frozen
      new_set_cookie_header = set_cookie_header.dup
      new_set_cookie_header << ';' if !(set_cookie_header =~ /;$/)
      new_set_cookie_header << ' SameSite=None'
      new_set_cookie_header << '; Secure' if # is_ssl?

      headers['Set-Cookie'] = new_set_cookie_header

    end

    [status, headers, body]
  end
end

Rails.application.config.middleware.insert_before(ActionDispatch::Cookies, SameSiteCookies)
