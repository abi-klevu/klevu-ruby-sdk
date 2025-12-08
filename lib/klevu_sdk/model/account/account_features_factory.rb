# frozen_string_literal: true

require_relative "account_features"
require_relative "account_features_option"

module KlevuSdk
  module Model
    class Account
      # Factory class to create new instances of AccountFeatures (immutable)
      #
      # @see AccountFeatures
      class AccountFeaturesFactory
        # Create a new AccountFeatures instance from a hash of flags
        #
        # @param data [Hash{String => Boolean}] keys are AccountFeaturesOption constants
        # @return [AccountFeatures]
        def create(data = {})
          AccountFeatures.new(
            smart_category_merchandising: data.fetch(
              KlevuSdk::Model::Account::AccountFeaturesOption::SMART_CATEGORY_MERCHANDISING,
              false,
            ),
            smart_recommendations: data.fetch(
              KlevuSdk::Model::Account::AccountFeaturesOption::SMART_RECOMMENDATIONS,
              false,
            ),
            preserve_layout: data.fetch(
              KlevuSdk::Model::Account::AccountFeaturesOption::PRESERVE_LAYOUT,
              false,
            ),
          )
        end
      end
    end
  end
end