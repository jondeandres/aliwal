require 'aliwal/zmq/sender'

module Aliwal
  module WhatsappDispatcher
    class Dispatcher
      def initialize(defaults)
        @defaults = defaults
      end

      def call(env)
        env['dispatcher.params'] = prepare_params(env)
        handler.call(env)
      end

      def prepare_params(env)
        default_params = @defaults.dup
        params_with_matcher = default_params.merge(env['router.matcher'].params)

        params_with_matcher
      end

      def handler
        handler_name = "#{@defaults[:handler]}Handler"
        ActiveSupport::Dependencies.constantize(handler_name.camelize)
      end
    end
  end
end
