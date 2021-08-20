require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp1
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6

    config.i18n.available_locales = [:en, :my]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true

  end
end
