require 'aliwal/zmq/sender'

module Aliwal
  module Whatsapp
    class Dispatcher
      def initialize
        @sender = Aliwal::ZMQ::Sender.new
        @sender.connect
      end

      def dispatch(request)
        if request.text?
          @sender.send_message(request.from, request.body.data)
        end
      end
    end

  end
end
