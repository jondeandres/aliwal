require 'aliwal/whatsapp/sender'

module Aliwal
  module Whatsapp
    def self.sender
      @sender ||= connect_sender
    end

    def self.connect_sender
      zmq_sender = Aliwal::Whatsapp::Sender.new
      zmq_sender.connect
      zmq_sender
    end
  end
end
