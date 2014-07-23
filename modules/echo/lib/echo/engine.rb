module Echo
  class Engine < ::Rails::Engine
    isolate_namespace Echo
  end
end
