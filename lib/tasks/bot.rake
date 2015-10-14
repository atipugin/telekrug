namespace :bot do
  task :enable_webhook, :url do |_, args|
    response =
      begin
        BOT.api.set_webhook(url: "#{args[:url]}/#{ENV['TELEGRAM_BOT_TOKEN']}")
      rescue Telegram::Bot::Exceptions::ResponseError => e
        e.response
      end
    p response['description']
  end

  task :disable_webhook do
    response = BOT.api.set_webhook(url: '')
    p response['description']
  end
end
