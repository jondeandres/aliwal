Echo::Engine.whatsapp_routes.draw do
  text '(?<text>.*)', to: 'echo/echo#text', prefix: 'echo'
  text '(?<text>.*)', to: 'echo/echo#upcase', prefix: 'up'
end
