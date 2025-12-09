# frozen_string_literal: true

module KlevuSdk
  module Provider
    class UserAgentProvider
      def initialize(
        user_agent_providers: []
      )
        user_agent_providers << UserAgent::KlevuSdkUserAgentProvider.new

        @user_agent_providers = user_agent_providers
      end

      def execute
        user_agent_strings = @user_agent_providers
                               .map(&:execute)
                               .compact
                               .reject(&:empty?)

        user_agent_strings.join(' ')
      end
    end
  end
end