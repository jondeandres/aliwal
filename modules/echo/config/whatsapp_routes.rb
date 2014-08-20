Echo::Engine.whatsapp_routes.draw do
  text '(?<text>.*)', to: 'echo/echo#text', prefix: 'Echo'
  text '(?<text>.*)', to: 'echo/echo#upcase', prefix: 'Up'
end
