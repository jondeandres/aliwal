require 'rails/engine'
require 'aliwal/whatsapp_dispatcher'

module Aliwal
  module Modules
    module Engine
      extend ActiveSupport::Concern

      included do
        initializer :add_modules_paths do
          config.paths.add 'config/whatsapp_routes.rb'
        end

        initializer :add_whatsapp_routing_paths, after: :add_modules_paths do |app|
          existing_paths = config.paths['config/whatsapp_routes.rb'].existent

          if existing_paths.any?
            app.whatsapp_routes_reloader.paths.unshift(*existing_paths)
            app.whatsapp_routes_reloader.route_sets << routes

            app.whatsapp_routes_reloader.execute_if_updated
          end
        end

        initializer :add_to_modules do |app|
          app.modules << self
        end
      end

      def whatsapp_routes
        @whatsapp_routes ||= Aliwal::WhatsappDispatcher::RouteSet.new
      end
    end
  end
end
