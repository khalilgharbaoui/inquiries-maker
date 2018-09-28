module Cre
  def self.dig(symbol)
    Rails.application.credentials.dig(Rails.env.to_sym, symbol)
  end
end
