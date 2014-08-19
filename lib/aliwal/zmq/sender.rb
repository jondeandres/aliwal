require 'aliwal/zmq'

module Aliwal
  module ZMQ
    class Sender
      def initialize
        @context = ::Aliwal::ZMQ.context
        @socket = @context.socket(::ZMQ::REQ)
      end

      def connect
        @socket.connect('tcp://127.0.0.1:5556')
      end

      def send_message(jid, body)
        @socket.send_string(message(jid, body))

        response = ''
        @socket.recv_string(response)
      end

      def message(jid, body)
        {
          jid: jid,
          body: body
        }.to_json
      end
    end
  end
end
