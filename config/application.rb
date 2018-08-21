require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module UsagleApp
  class Application < Rails::Application
    config.load_defaults 5.1
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :en

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures:        true,
                       view_spec:       false,
                       helper_specs:    false,
                       routing_specs:   false,
                       request_specs:   false,
                       controller_spec: true

      g.factory_bot dir: 'spec/factories'
    end
  end
end
