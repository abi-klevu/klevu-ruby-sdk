# frozen_string_literal: true

module KlevuSdk
  module Model
    class Account
      class AccountFeaturesOption
        attr_reader :key

        # public constructor
        def initialize(key)
          @key = key.freeze
        end

        # Predefined constants
        SMART_CATEGORY_MERCHANDISING = new('s.enablecategorynavigation').freeze
        SMART_RECOMMENDATIONS = new('allow.personalizedrecommendations').freeze
        PRESERVE_LAYOUT = new('s.preservedlayout').freeze

        ALL = [SMART_CATEGORY_MERCHANDISING, SMART_RECOMMENDATIONS, PRESERVE_LAYOUT].freeze

        # Equality
        def ==(other)
          other.is_a?(AccountFeaturesOption) && key == other.key
        end

        # String representation
        def to_s
          key
        end

        # Lookup by string
        def self.from_string(str)
          ALL.find { |feature| feature.key == str }
        end
      end
    end
  end
end
