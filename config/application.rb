require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module UsagleApp
  class Application < Rails::Application
    config.load_defaults 5.1
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :en
  end
end
