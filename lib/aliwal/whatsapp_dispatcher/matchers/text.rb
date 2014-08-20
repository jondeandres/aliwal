require 'aliwal/whatsapp_dispatcher/matcher'

module Aliwal
  module WhatsappDispatcher
    module Matchers
      class Text
        include Matcher

        def initialize(env, route)
          @env = env
          @route = route
          @match = request.body.data.match(@route.regex) if request.text?
        end

        def match?
          !!@match
        end

        def params
          return {} unless match?

          Hash[@match.names.zip(@match.captures)].symbolize_keys
        end
      end
    end
  end
end
