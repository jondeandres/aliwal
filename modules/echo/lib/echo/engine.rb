require 'aliwal/modules/engine'

module Echo
  class Engine < Rails::Engine
    isolate_namespace Echo
    include Aliwal::Modules::Engine
  end
end
