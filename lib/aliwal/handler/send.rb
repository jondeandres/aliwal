module Aliwal
  module Handler
    module Send
      def send_text(text)
        sender.send_message(request.from, text)
      end

      def sender
        Aliwal::Whatsapp.sender
      end
    end
  end
end
