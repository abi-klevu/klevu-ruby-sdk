# frozen_string_literal: true

module KlevuSdk
  module Provider
    module UserAgent
      module System
        class RubyVersionProvider

          def execute
            'Ruby %s' % [RUBY_VERSION]
          end
        end
      end
    end
  end
end
