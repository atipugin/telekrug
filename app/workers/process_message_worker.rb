module Telekrug
  module Workers
    class ProcessMessageWorker < Base
      def perform(message_dump)
        message = YAML.load(message_dump)
        user =
          Telekrug::Models::User.find_or_create(telegram_id: message.from.id)
        command_klass(message.text).execute(message, user)
      end

      private

      def command_klass(text)
        case text
        when '/start'
          Telekrug::Commands::Start
        when '/stop'
          Telekrug::Commands::Stop
        else
          Telekrug::Commands::Missing
        end
      end
    end
  end
end
