require 'json'
require 'aliwal/whatsapp_dispatcher/dispatcher'
require 'aliwal/whatsapp/input'

module Aliwal
  module ZMQ
    class Receiver
      def initialize
        @context = ::Aliwal::ZMQ.context
        @socket = @context.socket(::ZMQ::REP)
      end

      def bind
        @socket.bind('tcp://*:5555')
      end

      def routes
        Rails.application.modules.map(&:whatsapp_routes)
      end

      def subscribe
        loop do
          @socket.recv_string(data = '')
          message = JSON.parse(data)

          begin
            dispatch(env_for(message))
          rescue => e
            puts e
            puts e.backtrace.join("\n")
          ensure
            @socket.send_string('')
          end
        end
      end

      def dispatch(env)
        routes.each do |route_set|
          route_set.call(env)
        end
      end

      def env_for(message)
        {
          'message' => message,
          'whatsapp.input' => Aliwal::Whatsapp::Input.new(message)
        }
      end
    end
  end
end
