require 'aliwal/handler/base'
require 'uri'
require 'cgi'

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

    def meme
      send_image(url: meme_url)
    end

    private

    def meme_url
      uri = URI.parse('http://apimeme.com/meme')
      query = {
        meme: 'Condescending+Wonka',
        top: params[:top].gsub(' ', '+'),
        bottom: ''
      }

      uri.query = CGI.unescape(query.to_query).to_s
      uri.to_s
    end
  end
end
