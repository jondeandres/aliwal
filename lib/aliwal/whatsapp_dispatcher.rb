require 'active_support/dependencies/autoload'
require 'aliwal/whatsapp_dispatcher/route_set'

module Aliwal
  module WhatsappDispatcher
    extend ActiveSupport::Autoload

    autoload :Mapper
    autoload :Mapping
    autoload :Route
    autoload :Router
    autoload :Routes
    autoload :RouteSet
    autoload :Dispatcher
    autoload :Matchers
  end
end
