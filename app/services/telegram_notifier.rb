# frozen_string_literal: true

class TelegramNotifier
  MAX_MESSAGE_LENGTH = 3754
  def initialize(object)
    @message = "#{JSON.pretty_generate(object.as_json)}"
    @object_class_name = "*#{object.class.name}:*\n"
    @bot = Telebot::Client.new(Cre.dig(:telegram_token))
    @uid = Cre.dig(:telegram_user_id)
    send_message
  end

  private

  def send_message
    message_chuncks = @message.chars.each_slice(MAX_MESSAGE_LENGTH).map(&:join)
    message_chuncks.each_with_index do |text, i|
      message = "```json\n#{text}\n```"
      message = message.prepend(@object_class_name) if i == 0
      @bot.send_message(
        chat_id: @uid,
        text: message,
        parse_mode: 'Markdown'
      )
    end
  end
end
