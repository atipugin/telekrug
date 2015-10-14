require 'bundler/setup'
require 'sinatra/base'
require 'dotenv'
require 'telegram/bot'
require 'sidekiq'
require 'sequel'

Dotenv.load

BOT = Telegram::Bot::Client.new(ENV['TELEGRAM_BOT_TOKEN'])
ROOT = Pathname.new(File.expand_path('../', __FILE__))
DB = Sequel.connect(ENV['DATABASE_URL'])

$LOAD_PATH << ROOT.to_s

require 'app/workers'
require 'app/models'
require 'app/routes'

module Telekrug
  class App < Sinatra::Application
    use Telekrug::Routes::Bot
  end
end
