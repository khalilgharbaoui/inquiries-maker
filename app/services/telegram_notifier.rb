class TelegramNotifier

  def initialize(object)
    @message = "*#{object.class.name}:*\n```json\n#{JSON.pretty_generate(object.as_json)}\n```"
    @bot = Telebot::Client.new(Rails.application.credentials.dig(Rails.env.to_sym,:telegram_token))
    @uid = Rails.application.credentials.dig(Rails.env.to_sym,:telegram_user_id)
    send_message
  end

  private

  def send_message
    @bot.send_message(
      chat_id: @uid,
      text: @message,
      parse_mode: "Markdown"
    )
  end
end
