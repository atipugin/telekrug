require 'bundler/setup'
require 'sinatra/base'
require 'dotenv'
require 'telegram/bot'
require 'sidekiq'

Dotenv.load

BOT = Telegram::Bot::Client.new(ENV['TELEGRAM_BOT_TOKEN'])
ROOT = Pathname.new(File.expand_path('../', __FILE__))

$: << ROOT.to_s

require 'app/workers'

module Telekrug
  class App < Sinatra::Application
    post "/#{ENV['TELEGRAM_BOT_TOKEN']}" do
      request.body.rewind
      update = Telegram::Bot::Types::Update.new(JSON.parse(request.body.read))
      Workers::ProcessMessageWorker.perform_async(YAML.dump(update.message))
    end
  end
end
