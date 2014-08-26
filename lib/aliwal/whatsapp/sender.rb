require 'ffi-rzmq'

module Aliwal
  module Whatsapp
    class Sender
      def initialize
        @context = ::ZMQ::Context.new
        @socket = @context.socket(::ZMQ::REQ)
      end

      def connect
        @socket.connect('tcp://127.0.0.1:5556')
      end

      def send_text(jid, text)
        message = {
          jid: jid,
          body: text,
          type: 'text'
        }.to_json

        send_frame(message)
      end

      def send_image(jid, options)
        message = {
          jid: jid,
          type: 'url_image'
        }.merge(options).to_json

        send_frame(message)
      end

      def send_frame(object)
        @socket.send_string(object)

        response = ''
        @socket.recv_string(response)
      end
    end
  end
end
