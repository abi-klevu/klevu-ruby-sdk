# frozen_string_literal: true

module KlevuSdk
  module Model
    # Representation of an HTTP response from an API call made by the SDK
    #
    # @since 1.0.0
    class ApiResponse
      attr_reader :response_code, :message, :status, :job_id, :errors

      # @param response_code [Integer] HTTP status code returned by the response
      # @param message [String] Message returned by the API within the response body (optional)
      # @param status [String, nil] Status returned by the API within the response body (optional)
      # @param job_id [String, nil] ID of job created in Klevu pipelines (optional)
      # @param errors [Array<String>, nil] Array of errors returned by the API (optional)
      def initialize(
        response_code:,
        message: '',
        status: nil,
        job_id: nil,
        errors: nil
      )
        @response_code = response_code
        @message = message
        @status = status
        @job_id = job_id
        @errors = errors || []
      end

      # Returns true if the response was successful (HTTP 200 and no errors)
      #
      # @return [Boolean]
      def success?
        response_code == 200 && errors.empty?
      end

      # Returns all messages including the main message and any errors
      #
      # @return [Array<String>]
      def messages
        ([message] + errors).compact.sort_by(&:downcase)
      end
    end
  end
end
