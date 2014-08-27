Api::Engine.routes.draw do
  post '/api/messages', to: 'messages#create'
  post '/api/chat', to: 'chat#create'
end
