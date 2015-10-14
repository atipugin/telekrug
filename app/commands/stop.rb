module Telekrug
  module Commands
    class Stop < Base
      def execute
        user.update(enabled: false)
        say('Goodbye ;(')
      end
    end
  end
end
