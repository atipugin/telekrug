require File.expand_path('../app.rb', __FILE__)
require 'sidekiq/web'

run Rack::URLMap.new('/' => Telekrug::App, '/sidekiq' => Sidekiq::Web)
