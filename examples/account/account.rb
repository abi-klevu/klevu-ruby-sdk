# frozen_string_literal: true

# Ensure the lib path is correct relative to this example file
require_relative "../../lib/klevu_sdk"

# Create an AccountFactory
account_factory = KlevuSdk::Model::AccountFactory.new
account_features_factory = KlevuSdk::Model::Account::AccountFeaturesFactory.new

# Create an Account using the factory
# Keys must match Account::FIELD_* constants (strings)
account = account_factory.create(
  KlevuSdk::Model::Account::FIELD_JS_API_KEY => 'klevu-1234567890',
  KlevuSdk::Model::Account::FIELD_REST_AUTH_KEY => 'ABCDE1234567890'
)
account.account_features = account_features_factory.create(
  KlevuSdk::Model::Account::AccountFeaturesOption::SMART_CATEGORY_MERCHANDISING => true
)

# Print the hash representation of the account
puts account.to_h
puts account.account_features.to_h