# frozen_string_literal: true

module KlevuSdk
  module Provider
    module UserAgent
      module System
        class RubyVersionProvider

          def execute
            RUBY_VERSION
          end
        end
      end
    end
  end
end
