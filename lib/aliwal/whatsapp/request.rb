require 'json'
require 'base64'

module Aliwal
  module Whatsapp
    class Request
      ATTRIBUTES = %w(tag type from to id retry xmlns nodes)
      NODES = %w(body request notify composing paused)
      TYPES = %w(error notification subject chat)

      attr_reader :hash

      def initialize(hash)
        @hash = hash
      end

      def timestamp
        hash['t']
      end

      def data
        @data ||= Base64.decode64(raw_data) if raw_data
      end

      def raw_data
        hash['data']
      end

      TYPES.each do |_type|
        define_method("#{_type}?") do
          type == _type
        end
      end

      ATTRIBUTES.each do |attribute|
        define_method(attribute) do
          hash[attribute]
        end
      end

      # Here comes node methods
      NODES.each do |node_type|
        define_method(node_type) do
          find_node(node_type)
        end

        define_method("#{node_type}?") do
          exists_node?(node_type)
        end
      end

      def text?
        chat? && body?
      end

      private

      def exists_node?(tag)
        find_node(tag).present?
      end

      def find_node(tag)
        node = nodes[tag]
        self.class.new(node) if node
      end
    end
  end
end
