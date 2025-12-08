# frozen_string_literal: true

require_relative "lib/klevu_sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "klevu_sdk"
  spec.version       = KlevuSdk::VERSION
  spec.authors       = ["Abi Green"]
  spec.email         = ["abi.green@athoscommerce.com"]
  spec.summary       = "Klevu indexing and account SDK for Ruby"
  spec.description   = "Klevu indexing and account SDK for Ruby"
  spec.homepage      = "https://github.com/abi-klevu/klevu-ruby-sdk"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "README.md", "LICENSE.txt"]
  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "faraday", ">= 1.0"
  spec.add_dependency "multi_json"
end
