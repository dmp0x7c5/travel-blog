# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TravelBlog
  class Application < Rails::Application
    config.load_defaults 5.1
    config.generators.system_tests = nil

    config.paths.add File.join("app", "services"), glob: File.join("**", "*.rb")
    config.paths.add "lib", eager_load: true

    ActionMailer::Base.smtp_settings = {
      address:        Rails.application.secrets.smtp[:address],
      domain:         Rails.application.secrets.domain_name,
      password:       Rails.application.secrets.smtp[:password],
      port:           Rails.application.secrets.smtp[:port],
      user_name:      Rails.application.secrets.smtp[:user_name],
      authentication: :plain,
      enable_starttls_auto: true,
    }
    config.action_mailer.default_url_options = { host: Rails.application.secrets.mailer_default_url }

    config.time_zone = "Europe/Warsaw"
  end
end
