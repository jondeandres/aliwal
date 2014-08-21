require 'aliwal/handler/base'
require 'weather/request'

module Weather
  class MainHandler < Aliwal::Handler::Base
    def current
      send_text current_weather_text(weather)
    end

    def tomorrow 
      send_text tomorrow_weather_text(weather)
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

    def tomorrow_weather_text(data)
      not_found_place(data['error'][0]) if data['error']
      tomorrow_data = data['weather'][0]
      request_data = data['request'][0]

      <<-END
Location: #{request_data['query']}, #{request_data['type']}
Description: #{tomorrow_data['weatherDesc'][0]['value']}
Temperature: #{tomorrow_data['tempMinC']}/#{tomorrow_data['tempMaxC']}
Humidity: #{tomorrow_data['humidity']}
Precip: #{tomorrow_data['precipMM']}
END
    end

    def not_found_place(error)
      send_text error['msg']
      return
    end

    def weather
      Weather::Request.request(params[:place])
    end
  end
end
