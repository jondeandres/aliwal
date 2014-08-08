module Aliwal
  module WhatsappDispatcher
    module Matcher
      def request
        @env['request']
      end
    end
  end
end
