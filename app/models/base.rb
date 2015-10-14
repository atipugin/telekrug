module Telekrug
  module Models
    class Base < Sequel::Model
      plugin :timestamps
    end
  end
end
