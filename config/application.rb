require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

require 'aliwal'

module Aliwal
  class Application < Rails::Application
    def whatsapp_routes_reloader
      @whatsapp_routes_reloader ||= Rails::Application::RoutesReloader.new
    end

    attr_writer :modules

    def modules
      @modules ||= []
    end

    config.after_initialize { whatsapp_routes_reloader.execute_if_updated }
  end
end
