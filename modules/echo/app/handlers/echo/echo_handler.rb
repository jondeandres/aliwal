require 'aliwal/handler/base'

module Echo
  class EchoHandler < Aliwal::Handler::Base
    def text
      send_text params[:text]
    end

    def upcase
      send_text params[:text].upcase
    end

    def reverse
      send_text params[:text].reverse
    end
  end
end
