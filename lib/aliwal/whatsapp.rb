module Aliwal
  module Whatsapp
    def self.sender
      @sender ||= connect_sender
    end

    def self.connect_sender
      zmq_sender = Aliwal::ZMQ::Sender.new
      zmq_sender.connect
      zmq_sender
    end
  end
end
