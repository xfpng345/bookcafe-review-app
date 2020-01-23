require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module BookcafeReviewApp
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
