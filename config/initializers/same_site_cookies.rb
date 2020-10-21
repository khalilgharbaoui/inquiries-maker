# frozen_string_literal: false

class SameSiteCookies
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    set_cookie_header = headers['Set-Cookie']

    if set_cookie_header && !(set_cookie_header =~ /SameSite\=/)

      headers['Set-Cookie'] << ';' unless set_cookie_header =~ /;$/
      headers['Set-Cookie'] << ' SameSite=None'
      headers['Set-Cookie'] << '; Secure' # if env['rack.url_scheme'] == 'https';

    end

    [status, headers, body]
  end
end

Rails.application.config.middleware.insert_before(ActionDispatch::Cookies, SameSiteCookies)
