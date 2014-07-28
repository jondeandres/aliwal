module Aliwal
  module WhatsappDispatcher
    class RouteSet
      def draw(&block)
        instance_exec(&block)
      end
    end
  end
end
