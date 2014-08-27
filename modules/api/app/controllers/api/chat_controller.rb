require 'base64'
require 'aliwal/whatsapp/receiver'

module Api
  class ChatController < ApplicationController
    def create
      jid =  "#{params[:phone]}@s.whatsapp.net"
      message = params[:message]

      receiver.dispatch(message_for(jid, message))

      render json: { status: :queued }
    end

    def message_for(jid, message)
      {
        'from' => jid,
        'nodes' => {
          'body' => {
            'tag' => 'body',
            'data' => Base64.encode64(message)
          }
        },
        'type' => 'chat'
      }
    end

    def receiver
      @receiver ||= Aliwal::Whatsapp::Receiver::Dispatcher.new
    end
  end
end
