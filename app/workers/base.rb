module Telekrug
  module Workers
    class Base
      include Sidekiq::Worker
    end
  end
end
