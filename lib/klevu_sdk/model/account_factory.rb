# frozen_string_literal: true

require_relative "account"
require_relative "account/account_features_factory"
require_relative "account/account_features_option"

module KlevuSdk
  module Model
    # Factory class to create new instances of Account
    #
    # @see Account
    class AccountFactory
      # Creates a new Account instance populated with the passed data
      #
      # @param data [Hash{String => Object}] keys correspond to Account::FIELD_* constants
      # @return [Account]
      def create(data = {})
        account = Account.new

        account.js_api_key = data[Account::FIELD_JS_API_KEY] if data.key?(Account::FIELD_JS_API_KEY)
        account.rest_auth_key = data[Account::FIELD_REST_AUTH_KEY] if data.key?(Account::FIELD_REST_AUTH_KEY)
        account.platform = data[Account::FIELD_PLATFORM] if data.key?(Account::FIELD_PLATFORM)
        account.active = !!data[Account::FIELD_ACTIVE] if data.key?(Account::FIELD_ACTIVE)
        account.company_name = data[Account::FIELD_COMPANY_NAME] if data.key?(Account::FIELD_COMPANY_NAME)
        account.email = data[Account::FIELD_EMAIL] if data.key?(Account::FIELD_EMAIL)
        account.indexing_url = data[Account::FIELD_INDEXING_URL] if data.key?(Account::FIELD_INDEXING_URL)
        account.search_url = data[Account::FIELD_SEARCH_URL] if data.key?(Account::FIELD_SEARCH_URL)
        account.smart_category_merchandising_url = data[Account::FIELD_SMART_CATEGORY_MERCHANDISING_URL] if data.key?(Account::FIELD_SMART_CATEGORY_MERCHANDISING_URL)
        account.analytics_url = data[Account::FIELD_ANALYTICS_URL] if data.key?(Account::FIELD_ANALYTICS_URL)
        account.js_url = data[Account::FIELD_JS_URL] if data.key?(Account::FIELD_JS_URL)
        account.tiers_url = data[Account::FIELD_TIERS_URL] if data.key?(Account::FIELD_TIERS_URL)
        account.indexing_version = data[Account::FIELD_INDEXING_VERSION] if data.key?(Account::FIELD_INDEXING_VERSION)
        account.default_currency = data[Account::FIELD_DEFAULT_CURRENCY] if data.key?(Account::FIELD_DEFAULT_CURRENCY)

        account
      end
    end
  end
end
