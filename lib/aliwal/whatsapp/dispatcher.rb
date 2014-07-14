require 'aliwal/zmq/sender'

module Aliwal
  module Whatsapp
    class Dispatcher
      def initialize
        @sender = Aliwal::ZMQ::Sender.new
        @sender.connect
      end

      def dispatch(hash)
        return unless hash

        message(hash['message']) if hash['message']
        presence(hash['presence']) if hash['presence']
      end

      private

      def presence(presence)
        if presence['add']
          Group.create(uid: presence['from'])
        end
      end

      # notify && body => chat message
      def message(msg)
        if msg['notify'] && msg['body']
          from = msg['from']
          name = msg['notify']['name']

          group = Group.where(uid: from).first_or_create

          return unless group

          group.messages.create(author: name, value: msg['body'][1..-1])

          @sender.send_message(from, body)
        end
      end
    end

  end
end
