# frozen_string_literal: true

module KlevuSdk
  module Model
    # Immutable credentials container
    class AccountCredentials
      attr_reader :js_api_key, :rest_auth_key

      def initialize(js_api_key:, rest_auth_key:)
        @js_api_key = js_api_key.freeze
        @rest_auth_key = rest_auth_key.freeze
        freeze
      end
    end
  end
end
