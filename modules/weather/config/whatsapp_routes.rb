Weather::Engine.whatsapp_routes.draw do
  text '(?<place>.*)', to: 'weather/main#current', prefix: 'Temp'
  text '(?<place>.*)', to: 'weather/main#tomorrow', prefix: 'Temptomorrow'
end
