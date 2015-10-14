module Telekrug
  module Models
    class User < Base
      set_dataset :users
      plugin :enum
      enum :current_command, []
    end
  end
end
