require 'net/http'
require 'addressable/uri'
require 'uri'
require 'json'

module Weather
  class Request
    def self.current(name)
      new.current(name)
    end

    def current(name)
      response = request(name)
      response['data']['current_condition'][0]
    end

    def request(name)
      uri = Addressable::URI.new(uri_params)
      uri.query = URI.encode_www_form(params(name))

      JSON.parse(Net::HTTP.get(URI(uri.to_s)))
    end

    def params(name)
      {
        q: name,
        num_of_days: 3,
        key: api_key,
        format: 'json'
      }
    end

    def uri_params
      {
        scheme: 'http',
        host: 'api.worldweatheronline.com',
        path: '/free/v1/weather.ashx'
      }
    end

    def api_key
      '54bccf1595b942a557514bcf6ac35846feab715b'
    end
  end
end