Weather::Engine.whatsapp_routes.draw do
  text '(?<place>.*)', to: 'weather/main#current', prefix: 'temp|Temp'
end
