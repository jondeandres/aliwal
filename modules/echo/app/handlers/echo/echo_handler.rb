require 'aliwal/handler/base'

module Echo
  class EchoHandler < Aliwal::Handler::Base
    def text
      send_text request.from, params[:text]
    end
  end
end
