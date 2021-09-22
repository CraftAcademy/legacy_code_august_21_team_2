# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module MyAwesomeApi
  class Application < Rails::Application
    config.load_defaults 5.1

    config.api_only = true
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.skip_routes false
      generate.helper_specs false
      generate.controller_specs false
      generate.request_specs false
    end
  end
end
