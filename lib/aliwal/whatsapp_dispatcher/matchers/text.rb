require 'aliwal/whatsapp_dispatcher/matcher'

module Aliwal
  module WhatsappDispatcher
    module Matchers
      class Text
        include Matcher

        def initialize(env, route)
          @env = env
          @route = route
        end

        def match?
          !!(request.body.data =~ @route.regex)
        end
      end
    end
  end
end
