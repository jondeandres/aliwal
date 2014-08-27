require 'aliwal/whatsapp'

module Aliwal
  module Handler
    module Send
      def send_text(text)
        sender.send_text(request.from, text)
      end

      def send_text_to(jid, text)
        sender.send_text(jid, text)
      end

      def send_image(options = {})
        sender.send_image(request.from, options)
      end

      def sender
        Aliwal::Whatsapp.sender
      end
    end
  end
end
