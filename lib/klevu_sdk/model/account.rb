# frozen_string_literal: true

require_relative "account/account_features"
require_relative "account/account_features_factory"

module KlevuSdk
  module Model
    # Data model representation of a Klevu store-level account as identified by a unique JS API Key
    #
    # @note Does not perform validation or persistence of data
    # @see KlevuSdk::Service::Account::AccountLookupService
    class Account
      # Field keys for to_h serialization
      FIELD_JS_API_KEY = "jsApiKey"
      FIELD_REST_AUTH_KEY = "restAuthKey"
      FIELD_PLATFORM = "platform"
      FIELD_ACTIVE = "active"
      FIELD_COMPANY_NAME = "companyName"
      FIELD_EMAIL = "email"
      FIELD_INDEXING_URL = "indexingUrl"
      FIELD_SEARCH_URL = "searchUrl"
      FIELD_SMART_CATEGORY_MERCHANDISING_URL = "smartCategoryMerchandisingUrl"
      FIELD_ANALYTICS_URL = "analyticsUrl"
      FIELD_JS_URL = "jsUrl"
      FIELD_TIERS_URL = "tiersUrl"
      FIELD_INDEXING_VERSION = "indexingVersion"
      FIELD_DEFAULT_CURRENCY = "defaultCurrency"

      attr_accessor :js_api_key,
                    :rest_auth_key,
                    :platform,
                    :active,
                    :company_name,
                    :email,
                    :indexing_url,
                    :search_url,
                    :smart_category_merchandising_url,
                    :analytics_url,
                    :js_url,
                    :tiers_url,
                    :indexing_version,
                    :default_currency

      # Lazy-loaded account features
      attr_reader :account_features

      def initialize
        @active = false
        @indexing_version = ""
        @default_currency = ""
        @account_features = nil
      end

      # Sets account_features explicitly
      #
      # @param features [KlevuSdk::Model::AccountFeatures]
      def account_features=(features)
        @account_features = features
      end

      # Lazy-load AccountFeatures if not set
      #
      # @return [KlevuSdk::Model::AccountFeatures]
      def account_features
        @account_features ||= AccountFeaturesFactory.new.create([])
      end

      # Returns a Hash representation of the account
      #
      # @return [Hash{String => Object}]
      def to_h
        {
          FIELD_JS_API_KEY => js_api_key,
          FIELD_REST_AUTH_KEY => rest_auth_key,
          FIELD_PLATFORM => platform,
          FIELD_ACTIVE => active,
          FIELD_COMPANY_NAME => company_name,
          FIELD_EMAIL => email,
          FIELD_INDEXING_URL => indexing_url,
          FIELD_SEARCH_URL => search_url,
          FIELD_SMART_CATEGORY_MERCHANDISING_URL => smart_category_merchandising_url,
          FIELD_ANALYTICS_URL => analytics_url,
          FIELD_JS_URL => js_url,
          FIELD_TIERS_URL => tiers_url,
          FIELD_INDEXING_VERSION => indexing_version,
          FIELD_DEFAULT_CURRENCY => default_currency
        }
      end
    end
  end
end
