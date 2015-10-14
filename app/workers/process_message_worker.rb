module Telekrug
  module Workers
    class ProcessMessageWorker < Base
      def perform(message_dump)
        message = YAML.load(message_dump)
        user =
          Telekrug::Models::User.find_or_create(telegram_id: message.from.id)
        command_klass(message, user).execute(message, user)
      end

      private

      def command_klass(message, user)
        current_command_klass(user) ||
          command_klass_by_text(message.text) ||
          Telekrug::Commands::Missing
      end

      def current_command_klass(user)
        return unless user.current_command
      end

      def command_klass_by_text(text)
        case text
        when '/start'
          Telekrug::Commands::Start
        when '/stop'
          Telekrug::Commands::Stop
        when '/cancel'
          Telekrug::Commands::Cancel
        end
      end
    end
  end
end
