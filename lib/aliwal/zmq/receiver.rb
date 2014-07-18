#!/usr/bin/env ruby

require 'ffi-rzmq'
require 'aliwal/whatsapp/dispatcher'
require 'aliwal/whatsapp/request'

module Aliwal
  module ZMQ
    class Receiver
      def initialize
        @context = ::ZMQ::Context.new
        @socket = @context.socket(::ZMQ::REP)
        @dispatcher = Aliwal::Whatsapp::Dispatcher.new
      end

      def bind
        @socket.bind('tcp://*:5555')
      end

      def subscribe
        loop do
          @socket.recv_string(data = '')
          request = Aliwal::Whatsapp::Request.create(data)

          # TODO: Check if request.from is in request.to Redis Set.


          begin
            @dispatcher.dispatch(request)
          rescue => e
            # TODO: errbit
          ensure
            @socket.send_string('')
          end
        end
      end
    end
  end
end
