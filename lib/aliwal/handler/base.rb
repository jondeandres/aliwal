require 'aliwal/handler/request'
require 'active_support/core_ext/module/delegation'

module Aliwal
  module Handler
    class Base
      attr_reader :request
      delegate :params, to: :request

      def self.call(env)
        # TODO: middlewares
        action(env['dispatcher.params'][:action], env)
      end

      def self.action(name, env)
        new.dispatch(name, Aliwal::Handler::Request.new(env))
      end

      def dispatch(name, request)
        @request = request

        send_action(name)
      end

      alias_method :send_action, :send

      def params
        @request.params
      end
    end
  end
end
