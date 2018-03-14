# frozen_string_literal: true

module API
  module V1Helpers
    module Errors
      extend ::Grape::API::Helpers

      def error_jsonapi(message, status, ex = nil)
        return error_array_jsonapi(message, 422) if message.is_a?(Hash)

        error = single_error(message, status)
        output_errors!([verbose_error(error, ex)], status)
      end

      private

      def error_array_jsonapi(messages, status)
        output_errors!(fill_errors_array([], messages, status), status)
      end

      def output_errors!(errors, status)
        error!({ errors: errors }, status)
      end

      def fill_errors_array(errors, messages, status)
        messages.each do |field, cases|
          cases.each do |desc|
            errors << single_error(field, status, "#{field.to_s.humanize} #{desc}")
          end
        end
        errors
      end

      def single_error(title, status, detail = nil)
        {
          title: title,
          detail: detail.presence,
          status: status,
        }.compact
      end

      def verbose_error(error, ex)
        return error if !Rails.env.development? || ex.nil?
        error.merge!(verbose_error_exception_details(ex))
      end

      def verbose_error_exception_details(ex)
        {
          klass: ex.class.to_s,
          description: ex.message,
          backtrace: ex.backtrace,
        }
      end
    end
  end
end
