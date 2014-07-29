module Aliwal
  module WhatsappDispatcher
    class Route
      attr_reader :type, :options

      def initialize(options)
        @type = options.delete(:type)
        @options = options
      end

      def text?
        @type == :text
      end

      def image?
        @type == :image
      end

      def prefix
        @options[:prefix]
      end

      def regex
        @options[:regex]
      end
    end
  end
end
