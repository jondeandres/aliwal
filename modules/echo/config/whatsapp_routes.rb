Echo::Engine.whatsapp_routes.draw do
  text 'Meme (?<top>.*)', to: 'echo/echo#meme'
  text '(?<text>.*)', to: 'echo/echo#text', prefix: 'Echo'
  text '(?<text>.*)', to: 'echo/echo#upcase', prefix: 'Up'
  text '(?<text>.*)', to: 'echo/echo#reverse', prefix: 'Reverse'
  text 'About', to: 'echo/about#about'
  text 'About jon', to: 'echo/about#jon'

  prefix 'Cv' do
    text 'jon', to: 'echo/cv#jon'
  end
end
