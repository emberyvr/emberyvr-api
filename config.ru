# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application


require 'rack/cors'
use Rack::Cors do
  # if ENV['RACK_ENV'] == 'production'
  #   allow do
  #     origins 'https://emberyvr.com'
  #     resource '*',
  #       headers: :any,
  #       methods: :any
  #   end
  #
  # else # allow all origins in development
    allow do
      origins '*'
      resource '*',
        headers: :any,
        methods: :any
    end
  # end
end
