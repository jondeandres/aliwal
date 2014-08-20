require 'aliwal/handler/base'
require 'weather/request'

module Weather
  class MainHandler < Aliwal::Handler::Base
    def current
      send_text current_weather_text(current_weather)
    end

    private

    def current_weather_text(data)
      <<-END
Location: #{params[:place]}
Description: #{data['weatherDesc'][0]['value']}
Temperature: #{data['temp_C']}
Humidity: #{data['humidity']}
END
    end

    def current_weather
      Weather::Request.current(params[:place])
    end
  end
end
