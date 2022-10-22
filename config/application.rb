require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBoilerplate
  class Application < Rails::Application
    # Provides an HTML generator for displaying errors that come from Active Model
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      raw Nokogiri::HTML.fragment(html_tag).child.add_class("is-invalid")
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_job.queue_adapter = :sidekiq unless Rails.env.test?
  end
end
