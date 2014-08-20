require 'aliwal/modules/engine'

module Weather
  class Engine < ::Rails::Engine
    isolate_namespace Weather
    include Aliwal::Modules::Engine
  end
end
