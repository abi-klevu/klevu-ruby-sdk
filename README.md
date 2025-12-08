# klevu-sdk

The Klevu Ruby SDK is a small package designed to simplify communicating with Klevu API services.

## Getting Started

1. **[Create an account with Klevu](https://box.klevu.com/merchant/signup)**.  
   Free trial, with full access to all features is available.
2. Retrieve your **JS API Key** and **REST AUTH Key** from Store Settings > Store Info in your account.
3. **Install the SDK** in your application using RubyGems
```bash
gem install klevu-sdk
```
4. **Start building!**  
   There are some quick start examples below, as well as detailed guides in our developer documentation

## System Requirements

To use this library, you must be running **Ruby 2.7** or above

## Quick Start Guide

### Account Credentials

The [AccountCredentials](lib/klevu_sdk/model/account_credentials.rb) object is required by all services connecting with Klevu.  
You will need both your JS API Key (in the format `klevu-xxxxxxx`) and your REST AUTH Key from your Klevu account.

> When saving and accessing these credentials within your application, please treat the REST AUTH Key in the same
> manner as any other sensitive information, such as passwords.  
> If you need to change your REST AUTH Key, please [contact our support team](https://help.klevu.com/support/tickets/new).

Create a new `KlevuSdk::Model::AccountCredentials` object. Note, account credentials objects are immutable.

```ruby
require "klevu_sdk"

account_credentials = KlevuSdk::Model::AccountCredentials.new(
  js_api_key: "[Your JS API Key]", 
  rest_auth_key: "[Your REST AUTH Key]",
)
```

### Retrieving Account Details

The [AccountLookupService](lib/service/account/account_lookup_service.rb) lets you retrieve details about your Klevu account,
including hostnames required to push and pull data to other services.

```ruby
require "klevu_sdk"

account_lookup_service = KlevuSdk::Service::Account::AccountLookupService.new
account_credentials = KlevuSdk::Model::AccountCredentials.new(
  js_api_key: "[Your JS API Key]",
  rest_auth_key: "[Your REST AUTH Key]",
)

account = account_lookup_service.execute(
  account_credentials: account_credentials
)

puts account
```

