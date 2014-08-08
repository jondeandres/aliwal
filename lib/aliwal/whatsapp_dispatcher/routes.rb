require 'active_support/core_ext/module/delegation'
require 'aliwal/whatsapp_dispatcher/route'

module Aliwal
  module WhatsappDispatcher
    class Routes
      include Enumerable

      attr_reader :routes

      delegate :length, :last, :each, :clear, to: :routes

      def initialize
        @routes = []
      end

      def add_route(app, options)
        @routes << Route.new(app, options)
      end
    end
  end
end
