Echo::Engine.whatsapp_routes.draw do
  prefix 'echo' do
    text('(?<text>.*)', to: 'echo/echo#text')
  end
end
