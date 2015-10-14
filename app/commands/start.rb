module Telekrug
  module Commands
    class Start < Base
      def execute
        user.update(enabled: true)
        say('Hello!')
      end
    end
  end
end
