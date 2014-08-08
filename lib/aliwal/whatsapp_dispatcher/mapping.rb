require 'aliwal/whatsapp_dispatcher/dispatcher'

module Aliwal
  module WhatsappDispatcher
    class Mapping
      attr_reader :defaults, :options

      def initialize(options)
        @options = options
        @defaults = {}

        normalize_defaults!
      end

      def to_route
        [app, options]
      end

      private

      def to
        options[:to]
      end

      def app
        to.respond_to?(:call) ? to : dispatcher
      end

      def normalize_defaults!
        if to.is_a?(String)
          to = options[:to]
          handler, action = to.split('#')

          @defaults[:handler] = handler
          @defaults[:action] = action
        end
      end

      def dispatcher
        Dispatcher.new(defaults)
      end
    end
  end
end
