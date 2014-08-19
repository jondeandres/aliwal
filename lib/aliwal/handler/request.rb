require 'active_support/core_ext/module/delegation'

module Aliwal
  module Handler
    class Request
      attr_reader :env

      delegate :tag, :type, :from, :to, :id, :timestamp, to: :@_input

      def initialize(env)
        @env = env
        @_input = env['whatsapp.input']
      end

      def params
        @env['dispatcher.params']
      end
    end
  end
end
