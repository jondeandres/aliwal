require 'ffi-rzmq'

module Aliwal
  module ZMQ
    class Sender
      def initialize
        @context = ::ZMQ::Context.new
        @socket = @context.socket(::ZMQ::REQ)
      end

      def connect
        @socket.connect('tcp://127.0.0.1:5556')
      end

      def send_message(jid, body)
        @socket.send_string(message(jid, body))
        foo = ''
        @socket.recv_string(foo)
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
