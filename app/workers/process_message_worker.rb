module Telekrug
  module Workers
    class ProcessMessageWorker < Base
      def perform(message_dump)
        message = YAML.load(message_dump)
        Telekrug::Models::User.find_or_create(telegram_id: message.from.id)
        BOT.api.send_message(chat_id: message.from.id, text: 'Hello!')
      end
    end
  end
end
