Echo::Engine.whatsapp_routes.draw do
  prefix 'echo' do
    text(/(?<text>.*)/, to: 'echo#text')
  end
end
