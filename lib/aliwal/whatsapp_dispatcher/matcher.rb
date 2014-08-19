module Aliwal
  module WhatsappDispatcher
    module Matcher
      def request
        @env['whatsapp.input']
      end
    end
  end
end
