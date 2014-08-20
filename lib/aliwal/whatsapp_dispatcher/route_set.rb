require 'active_support/core_ext/module/delegation'
require 'aliwal/whatsapp_dispatcher/mapper'
require 'aliwal/whatsapp_dispatcher/routes'
require 'aliwal/whatsapp_dispatcher/router'

module Aliwal
  module WhatsappDispatcher
    class RouteSet
      attr_reader :set, :router

      def initialize
        @set = Routes.new
        @router = Router.new(@set)
      end

      def draw(&block)
        eval_block(block)
      end

      def add_route(app, options)
        @set.add_route(app, options)
      end

      def call(env)
        @router.call(env)
      end

      private

      def eval_block(block)
        mapper = Mapper.new(self)
        mapper.instance_exec(&block)
      end
    end
  end
end
