require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module ApiApp
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.autoload_paths += %W(#{config.root}/lib)

    if ENV["RAILS_ENV"] == 'test'
      # Rebuild ./schemata/schema.json
      system('bundle exec prmd combine schemata/yml/* > schemata/schema.json')

      schema = JSON.parse(File.read("#{Rails.root}/schemata/schema.json"))
      config.middleware.use Rack::JsonSchema::ErrorHandler
      config.middleware.use Rack::JsonSchema::ResponseValidation, schema: schema
    end
  end
end
