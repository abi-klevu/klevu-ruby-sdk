# frozen_string_literal: true

require_relative "../../lib/klevu_sdk"

user_agent_provider = KlevuSdk::Provider::UserAgentProvider.new

puts user_agent_provider.execute
