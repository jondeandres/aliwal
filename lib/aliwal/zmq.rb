require 'ffi-rzmq'

module Aliwal
  module ZMQ
    def self.context
      @context ||= ::ZMQ::Context.new
    end
  end
end
