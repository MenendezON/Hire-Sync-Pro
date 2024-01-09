require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HireSyncPro
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    config.assets.precompile += %w( plugins/icheck-bootstrap/icheck-bootstrap.min.css css/bootstrap.min.css plugins/fontawesome-free/css/all.min.css dist/css/adminlte.min.css )
    config.assets.precompile += %w( js/bootstrap.bundle.js custom.js plugins/jquery/jquery.min.js plugins/bootstrap/js/bootstrap.bundle.min.js dist/js/adminlte.min.js)
    


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
