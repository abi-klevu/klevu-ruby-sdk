# frozen_string_literal: true

module KlevuSdk
  module Model
    class Platform
      attr_reader :name

      # Define known platforms as constants
      MAGENTO = new('magento')
      SHOPIFY = new('shopify')
      SHOPIFY_PLUS = new('shopify-plus')
      BIGCOMMERCE = new('bigcommerce')
      CUSTOM = new('custom')

      ALL = [MAGENTO, SHOPIFY, SHOPIFY_PLUS, BIGCOMMERCE, CUSTOM].freeze

      def initialize(name)
        @name = name.freeze
      end

      # Boolean helpers
      def magento?
        self == MAGENTO
      end

      def shopify?
        [SHOPIFY, SHOPIFY_PLUS].include?(self)
      end

      def bigcommerce?
        self == BIGCOMMERCE
      end

      def custom?
        self == CUSTOM
      end

      # String representation
      def to_s
        name
      end

      # Equality based on name
      def ==(other)
        other.is_a?(Platform) && name == other.name
      end

      # Find a Platform by string
      def self.from_string(str)
        ALL.find { |p| p.name == str } || CUSTOM
      end
    end
  end
end