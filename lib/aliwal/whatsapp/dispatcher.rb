require 'aliwal/zmq/sender'

module Aliwal
  module Whatsapp
    class Dispatcher
      def initialize
        @sender = Aliwal::ZMQ::Sender.new
        @sender.connect
      end

      def dispatch(hash)
      end
    end
  end
end
