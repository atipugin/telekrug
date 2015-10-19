module Telekrug
  module Commands
    class Subscribe < Base
      def execute
        if query
          user.update(query: query, location: location)
          say("You've been subscribed on #{query}!")
        else
          say('Wtf?')
        end
      end

      private

      def query
        input_parts[0]
      end

      def location
        input_parts[1]
      end

      def input_parts
        @input_parts ||=
          message.text.sub('/subscribe', '').split(',').map(&:strip)
      end
    end
  end
end
