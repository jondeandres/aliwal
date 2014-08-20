require 'aliwal/handler/base'
require 'weather/request'

module Weather
  class MainHandler < Aliwal::Handler::Base
    def current
      send_text current_weather_text(current_weather)
    end

    private

    def current_weather_text(data)
      not_found_place(data['error'][0]) if data['error']
      current_data = data['current_condition'][0]
      request_data = data['request'][0]

      <<-END
Location: #{request_data['query']}, #{request_data['type']}
Description: #{current_data['weatherDesc'][0]['value']}
Temperature: #{current_data['temp_C']}
Humidity: #{current_data['humidity']}
END
    end

    def not_found_place(error)
      send_text error['msg']
      return
    end

    def current_weather
      Weather::Request.request(params[:place])
    end
  end
end
