require 'aliwal/whatsapp_dispatcher/mapping'

module Aliwal
  module WhatsappDispatcher
    SCOPE_OPTIONS = %i(prefix type separator)

    class Mapper
      def initialize(set)
        @set = set
        @scope = {}
      end

      def prefix(string, options = {}, &block)
        scope(prefix: string, type: :text, &block)
      end

      def text(regex, options = {})
        prefix = options[:prefix] || @scope[:prefix]

        regex.prepend("^#{prefix} ") if prefix

        options[:regex] = /#{regex}/
        options[:type] = :text

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
        mapping = Mapping.new(options)

        app, _options = mapping.to_route
        @set.add_route(app, _options)
      end
    end
  end
end
