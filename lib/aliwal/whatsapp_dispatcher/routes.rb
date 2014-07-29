module Aliwal
  module WhatsappDispatcher
    class Routes
      include Enumerable

      attr_reader :routes

      delegate :length, :last, :each, :clear, to: :routes

      def initialize
        @routes = []
      end

      def add_route(options)
        @routes << Route.new(options)
      end
    end
  end
end
