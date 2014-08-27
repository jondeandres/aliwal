require 'json'
require 'aliwal/zmq'
require 'aliwal/whatsapp_dispatcher/dispatcher'
require 'aliwal/whatsapp/input'

module Aliwal
  module Whatsapp
    class Receiver
      class Dispatcher
        def routes
          Rails.application.modules.map(&:whatsapp_routes)
        end
        def dispatch(message)
          env = env_for(message)
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

      def initialize
        @context = ::Aliwal::ZMQ.context
        @socket = @context.socket(::ZMQ::REP)
        @dispatcher = Dispatcher.new
      end

      def bind
        @socket.bind('tcp://*:5555')
      end

      def subscribe
        loop do
          @socket.recv_string(data = '')
          message = JSON.parse(data)

          begin
            @dispatcher.dispatch(message)
          rescue => e
            puts e
            puts e.backtrace.join("\n")
          ensure
            @socket.send_string('')
          end
        end
      end
    end
  end
end
