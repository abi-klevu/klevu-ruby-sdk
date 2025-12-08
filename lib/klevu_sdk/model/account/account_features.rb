# frozen_string_literal: true

module KlevuSdk
  module Model
    class Account
      # Immutable object storing flags for enabled features on a Klevu Account
      #
      # @see KlevuSdk::Model::Account::Account#get_account_features
      # @see KlevuSdk::Service::Account::AccountFeaturesService#execute
      class AccountFeatures
        attr_reader :smart_category_merchandising,
                    :smart_recommendations,
                    :preserve_layout

        # @param smart_category_merchandising [Boolean] defaults to false
        # @param smart_recommendations [Boolean] defaults to false
        # @param preserve_layout [Boolean] defaults to false
        def initialize(
          smart_category_merchandising: false,
          smart_recommendations: false,
          preserve_layout: false
        )
          @smart_category_merchandising = smart_category_merchandising
          @smart_recommendations = smart_recommendations
          @preserve_layout = preserve_layout
        end

        # Returns a Hash representation of the account
        #
        # @return [Hash{String => bool}]
        def to_h
          {
            smart_category_merchandising: @smart_category_merchandising,
            smart_recommendations: @smart_recommendations,
            preserve_layout: @preserve_layout,
          }
        end
      end
    end
  end
end