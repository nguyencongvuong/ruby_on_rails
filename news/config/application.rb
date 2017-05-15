require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProjectDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  config.assets.paths << Rails.root.join("app", "assets", "backend")
	config.assets.paths << Rails.root.join("app", "assets", "backend", "css")
  config.assets.paths << Rails.root.join("app", "assets", "backend", "js")
	config.assets.paths << Rails.root.join("app", "assets", "backend", "js","plugins","morris")
  config.assets.paths << Rails.root.join("app", "assets", "backend","css","plugins")
  config.assets.paths << Rails.root.join("app", "assets", "backend","font-awesome","css")
  config.assets.paths << Rails.root.join("app", "assets", "backend","font-awesome","fonts")
	
  end
end
