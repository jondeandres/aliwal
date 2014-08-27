require 'aliwal/handler/base'
require 'uri'
require 'cgi'

module Echo
  class CvHandler < Aliwal::Handler::Base
    def jon
      send_text 'jondeandres.github.io/static/cv.pdf'
    end
  end
end
