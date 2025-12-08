# frozen_string_literal: true

module KlevuSdk
  module Validator
    # Validator testing type and content of an expected AccountCredentials argument
    class AccountCredentialsValidator
      attr_reader :js_api_key_validator, :rest_auth_key_validator

      # @param js_api_key_validator [Object] optional custom validator for JS API Key
      # @param rest_auth_key_validator [Object] optional custom validator for REST AUTH Key
      def initialize(js_api_key_validator: nil, rest_auth_key_validator: nil)
        @js_api_key_validator = js_api_key_validator || JsApiKeyValidator.new
        @rest_auth_key_validator = rest_auth_key_validator || RestAuthKeyValidator.new
      end

      # Validates that the passed data is an AccountCredentials object
      # with valid JS API Key and REST AUTH Key
      #
      # @param data [Object] expected to be an AccountCredentials instance
      # @raise [InvalidTypeValidationError] if data is not AccountCredentials
      # @raise [InvalidDataValidationError] if either key fails validation
      def execute(data)
        unless data.is_a?(KlevuSdk::Model::AccountCredentials)
          raise InvalidTypeValidationError,
                "Account credentials must be of type #{KlevuSdk::Model::AccountCredentials}; " \
                  "received #{data.class}"
        end

        errors = []

        begin
          js_api_key_validator.execute(data.js_api_key)
        rescue InvalidDataValidationError => e
          errors.concat(e.errors)
        end

        begin
          rest_auth_key_validator.execute(data.rest_auth_key)
        rescue InvalidDataValidationError => e
          errors.concat(e.errors)
        end

        raise InvalidDataValidationError.new(errors) unless errors.empty?
      end
    end
  end
end
