require 'aliwal/handler/base'

module Echo
  class EchoHandler < Aliwal::Handler::Base
    def text
      send_text request.from, params[:text]
    end

    def upcase
      send_text request.from, params[:text].upcase
    end
  end
end
