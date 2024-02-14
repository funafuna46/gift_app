require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 7.0

    config.i18n.default_locale = :ja

    config.generators do |g|
      g.helper false
      g.test_framework false
    end
  end
end
