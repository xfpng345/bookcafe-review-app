require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module BookcafeReviewApp
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
