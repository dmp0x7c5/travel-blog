# frozen_string_literal: true

module API
  module V1
    module Rescuers
      extend ActiveSupport::Concern

      included do
        rescue_from Pundit::NotAuthorizedError do |ex|
          # Rollbar.error ex
          error_jsonapi "You are not authorized to perform this action.", 401, ex
        end
        rescue_from ActiveRecord::RecordInvalid, Grape::Exceptions::ValidationErrors do |ex|
          # Rollbar.warning ex
          error_jsonapi "Record invalid", 422, ex
        end
        rescue_from ActiveRecord::RecordNotFound do |ex|
          # Rollbar.warning ex
          error_jsonapi "Record not found", 404, ex
        end
        rescue_from :all do |ex|
          # Rollbar.error ex
          message = Rails.env.development? ? ex.message : "Something went wrong"
          error_jsonapi message, 500, ex
        end
      end
    end
  end
end
