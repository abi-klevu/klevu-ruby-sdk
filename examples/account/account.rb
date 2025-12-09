# frozen_string_literal: true

require_relative "../../lib/klevu_sdk"

account_factory = KlevuSdk::Model::AccountFactory.new
account_features_factory = KlevuSdk::Model::Account::AccountFeaturesFactory.new

account = account_factory.create(
  KlevuSdk::Model::Account::FIELD_JS_API_KEY => 'klevu-1234567890',
  KlevuSdk::Model::Account::FIELD_REST_AUTH_KEY => 'ABCDE1234567890'
)
account.account_features = account_features_factory.create(
  KlevuSdk::Model::Account::AccountFeaturesOption::SMART_CATEGORY_MERCHANDISING => true
)

puts account.to_h
puts account.account_features.to_h