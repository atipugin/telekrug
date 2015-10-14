require 'bundler/setup'
require 'sinatra/base'
require 'dotenv'

Dotenv.load

module Telekrug
  class App < Sinatra::Application
  end
end
