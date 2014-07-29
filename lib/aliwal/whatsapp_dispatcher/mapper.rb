module Aliwal
  module WhatsappDispatcher
    SCOPE_OPTIONS = %i(prefix type)

    class Mapper
      def initialize(set)
        @set = set
        @scope = {}
      end

      def prefix(string, options = {}, &block)
        scope(prefix: string, type: :text, &block)
      end

      def text(regex, options = {})
        options[:regex] = regex
        add_route(options)
      end

      def image(options = {})
        options[:type] = :image
        add_route(options)
      end

      def scope(options = {})
        recover = @scope.dup

        SCOPE_OPTIONS.each do |option|
          @scope[option] = options.delete(option)
        end

        yield
        self
      ensure
        @scope = recover
      end

      private

      def add_route(options)
        options.merge!(@scope)
        @set.add_route(options)
      end
    end
  end
end
