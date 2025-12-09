# frozen_string_literal: true

module KlevuSdk
  module Provider
    module UserAgent
      class KlevuSdkUserAgentProvider
        PRODUCT_NAME = 'klevu-ruby-sdk'

        def initialize(
          system_information_providers: []
        )
          system_information_providers << System::RubyVersionProvider.new

          @system_information_providers = system_information_providers
        end

        def execute
          system_information = @system_information_providers
                                 .map(&:execute)
                                 .compact
                                 .reject(&:empty?)

          user_agent = '%s/%s' % [PRODUCT_NAME, VERSION]
          unless system_information.empty?
            user_agent += " (#{system_information.join('; ')})"
          end

          user_agent
        end
      end
    end
  end
end