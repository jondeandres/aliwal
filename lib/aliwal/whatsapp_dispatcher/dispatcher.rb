require 'aliwal/zmq/sender'

module Aliwal
  module WhatsappDispatcher
    class Dispatcher
      def initialize(defaults)
        @defaults = defaults
        @sender = Aliwal::ZMQ::Sender.new
        @sender.connect
      end

      def call(env)
        request = env['request']
        @sender.send_message(request.from, 'foo!!!')
      end
    end
  end
end
