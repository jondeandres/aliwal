require 'aliwal/whatsapp_dispatcher/route_set'

module Aliwal
  module WhatsappDispatcher
    extend ActiveSupport::Autoload

    autoload :Mapper
    autoload :Route
    autoload :Routes
    autoload :RouteSet
  end
end
