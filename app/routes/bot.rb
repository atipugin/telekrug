module Telekrug
  module Routes
    class Bot < Base
      post "/#{ENV['TELEGRAM_BOT_TOKEN']}" do
        request.body.rewind
        update = Telegram::Bot::Types::Update.new(JSON.parse(request.body.read))
        Telekrug::Workers::ProcessMessage
          .perform_async(YAML.dump(update.message))
      end
    end
  end
end
