require 'bundler/setup'
require 'sinatra/base'
require 'dotenv'
require 'telegram/bot'

Dotenv.load

BOT = Telegram::Bot::Client.new(ENV['TELEGRAM_BOT_TOKEN'])

module Telekrug
  class App < Sinatra::Application
  end
end
