module Aliwal
  module WhatsappDispatcher
    class Router
      def initialize(routes)
        @routes = routes
      end

      def call(env)
        find_routes(env) do |route|
          route.app.call(env)
        end
      end

      def find_routes(env)
        @routes.each do |route|
          matcher = matcher_for(env, route)

          if matcher.match?
            env['router.matcher'] = matcher
            yield(route)
          end
        end
      end

      def matcher_for(env, route)
        type = route.type.to_s

        matcher_class = Aliwal::WhatsappDispatcher::Matchers.const_get(type.classify)
        matcher_class.new(env, route)
      end
    end
  end
end
