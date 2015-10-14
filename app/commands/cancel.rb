module Telekrug
  module Commands
    class Cancel < Base
      def execute
        user.update(current_command: nil)
      end
    end
  end
end
