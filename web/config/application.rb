require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BootstrapRailsDdd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    if Rails.env.development? || Rails.env.test?
      config.eager_load_paths << "#{Rails.root}/../application/src"
    else
 	# When deploy move application/src folder to app_core in rails root
      config.eager_load_paths << "#{Rails.root}/app_core"
    end

  end
end
