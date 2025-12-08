# frozen_string_literal: true

module KlevuSdk
  module Model
    # Strict enumeration of HTTP methods used by the SDK
    #
    # @since 1.0.0
    class HttpMethod
      attr_reader :name

      # Public constructor
      def initialize(name)
        @name = name.freeze
      end

      # Define constants
      GET    = new('GET').freeze
      POST   = new('POST').freeze
      PUT    = new('PUT').freeze
      DELETE = new('DELETE').freeze
      PATCH  = new('PATCH').freeze

      # Array of all defined enum values
      ALL = [GET, POST, PUT, DELETE, PATCH].freeze

      # String representation
      def to_s
        name
      end

      # Equality based on name
      def ==(other)
        other.is_a?(HttpMethod) && name == other.name
      end

      # Find a method by string
      def self.from_string(str)
        ALL.find { |method| method.name == str }
      end
    end
  end
end
