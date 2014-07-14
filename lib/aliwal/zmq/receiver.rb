#!/usr/bin/env ruby

require 'ffi-rzmq'
require 'json'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'
require 'aliwal/whatsapp/dispatcher'
require 'pp'

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
          request = ''
          @socket.recv_string(request)
          hash = Hash.from_xml(request) if request[0] == '<'

          begin
            @dispatcher.dispatch(hash)
          rescue => e
            pp e
            pp e.backtrace
            pp hash
          ensure
            @socket.send_string('received!')
          end
        end
      end
    end
  end
end
