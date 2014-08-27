module Api
  class MessagesController < ApplicationController
    def create
      jid =  "#{params[:phone]}@s.whatsapp.net"

      send_text_to(jid, params[:message])

      render json: { status: :queued }
    end
  end
end
