module Telekrug
  module Workers
    class ProcessMessageWorker < Base
      def perform(message_dump)
        message = YAML.load(message_dump)
        command = command_klass(message.text)
        return unless command

        user =
          Telekrug::Models::User.find_or_create(telegram_id: message.from.id)
        command.execute(message, user)
      end

      private

      def command_klass(text)
        case text
        when '/start'
          Telekrug::Commands::Start
        when '/stop'
          Telekrug::Commands::Stop
        end
      end
    end
  end
end
