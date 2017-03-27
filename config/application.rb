require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

# Would have preferred to put this in config/initializers/settingslogic.rb, but
# must load this before environment loads so that settings can be used in the env.
class Settings < Settingslogic
  source File.expand_path('config/settings.yml')
  namespace Rails.env

  # Load now, don't lazy load via method_missing. See https://github.com/binarylogic/settingslogic#readme
  load!
end

module Emberyvr
  class Application < Rails::Application
    # config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**/}')]
    config.autoload_paths << "#{config.root}/lib"
    config.autoload_paths << "#{config.root}/app/services"
    config.autoload_paths << "#{config.root}/app/policies"

    # Example from https://github.com/ruby-grape/grape
    config.paths.add File.join("app", "api"), glob: File.join("**", "*.rb")
    config.autoload_paths += Dir[Rails.root.join("app", "api", "*")]

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.assets false
      g.helper false
      g.helper_specs false
      g.test_framework false
      g.view_specs false
    end

    config.env = Rails.env

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
