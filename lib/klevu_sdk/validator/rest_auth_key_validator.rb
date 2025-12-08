# frozen_string_literal: true

module KlevuSdk
  module Validator
    # Validator testing type and format of Klevu REST AUTH Key (secret key)
    #
    # @since 1.0.0
    class RestAuthKeyValidator
      # Validates that the passed data is a string in the REST AUTH Key format
      #
      # @note Does NOT validate that the key corresponds to an existing Klevu account
      #
      # @param data [Object] any input to validate
      # @raise [InvalidTypeValidationError] if data is not a string
      # @raise [InvalidDataValidationError] if string is empty or not a valid REST AUTH Key
      def execute(data)
        unless data.is_a?(String)
          raise InvalidTypeValidationError, "REST AUTH Key must be of type String; received #{data.class}"
        end

        errors = []
        value = data.strip

        if value.empty?
          errors << 'REST AUTH Key must not be empty'
        elsif !value.match?(/\A[a-zA-Z0-9+\/=]{10,127}\z/)
          errors << 'REST AUTH Key is not valid'
        end

        raise InvalidDataValidationError, errors unless errors.empty?
      end
    end

    # Custom error classes matching PHP exceptions
    class InvalidTypeValidationError < StandardError; end

    class InvalidDataValidationError < StandardError
      attr_reader :errors

      def initialize(errors)
        @errors = errors
        super(errors.join(', '))
      end
    end
  end
end
