require 'active_support/core_ext/module/delegation'

module Aliwal
  module WhatsappDispatcher
    class RouteSet
      attr_reader :set

      def initialize
        @set = Routes.new
      end

      def draw(&block)
        eval_block(block)
      end

      def eval_block(block)
        mapper = Mapper.new(self)
        mapper.instance_exec(&block)
      end

      def add_route(options)
        @set.add_route(options)
      end
    end
  end
end
