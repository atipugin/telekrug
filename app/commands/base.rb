module Telekrug
  module Commands
    class Base
      attr_reader :message, :user

      def self.execute(*args)
        new(*args).execute
      end

      def initialize(message, user)
        @message = message
        @user = user
      end

      def execute
        fail NotImplementedError, 'You need to override this method first.'
      end

      private

      def say(text)
        BOT.api.send_message(chat_id: user.telegram_id, text: text)
      end
    end
  end
end
