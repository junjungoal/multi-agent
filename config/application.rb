require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MultiAgent
  class Application < Rails::Application
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.template_engine false 
      g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: false
    end
    config.active_record.raise_in_transactional_callbacks = true
    config.eager_load_paths += %W(#{config.root}/lib)
  end
end
