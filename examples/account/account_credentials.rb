# frozen_string_literal: true

require_relative "../../lib/klevu_sdk"

# Replace these with your actual Klevu keys
js_api_key   = "klevu-1234567890"
rest_auth_key = "ABCDE1234567890"

# Create a new AccountCredentials object
account_credentials = KlevuSdk::Model::AccountCredentials.new(
  js_api_key: js_api_key,
  rest_auth_key: rest_auth_key
)

# Output the object
puts "AccountCredentials object:"
puts "  JS API Key:    #{account_credentials.js_api_key}"
puts "  REST Auth Key: #{account_credentials.rest_auth_key}"

account_credentials_validator = KlevuSdk::Validator::AccountCredentialsValidator.new

begin
  account_credentials_validator.execute(account_credentials)
  puts "Credentials are valid"

rescue => e
  puts "Credentials are NOT valid"
  puts "Error: #{e.message}"

  if e.respond_to?(:errors)
    puts "Details:"
    e.errors.each { |err| puts " - #{err}" }
  end
end