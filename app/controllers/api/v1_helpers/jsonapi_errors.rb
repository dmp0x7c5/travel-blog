# frozen_string_literal: true

module API
  module V1Helpers
    module JsonapiErrors
      extend ::Grape::API::Helpers

      def render_jsonapi_errors(message, status, ex = nil)
        return array_of_errors(message, status) if message.is_a?(Hash)

        single_error = format_single_error(message)
        error!(
          format_errors(
            [maybe_verbose_error(single_error, ex)],
          ),
          status,
        )
      end

      private

      def format_errors(content)
        {
          errors: content,
        }
      end

      def array_of_errors(messages, status)
        error!(
          format_errors(
            array_from_error_messages(messages),
          ),
          status,
        )
      end

      def array_from_error_messages(messages)
        [].tap do |errors|
          messages.each do |field, cases|
            cases.each do |description|
              errors << format_single_error(field, "#{field.to_s.humanize} #{description}")
            end
          end
        end
      end

      def format_single_error(title, detail = nil)
        {
          title: title,
          detail: detail.presence,
        }.compact
      end

      def maybe_verbose_error(error, ex)
        return error if Rails.env.production? || ex.nil?
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
