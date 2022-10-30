module Notifyable
  extend ActiveSupport::Concern

  included do
    after_commit :send_telegram_notification, on: :create
  end

  def send_telegram_notification
    puts "###################################################################"
    warn("ℹ️  #{self.class.name} => ##{id}")
    puts "###################################################################"
    # Rails.env.to_sym == :production ? TelegramNotifier.new(self) : warn("ℹ️  #{self.class.name} => ##{id}")
  end
end
