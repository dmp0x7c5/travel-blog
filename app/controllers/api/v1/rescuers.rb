# frozen_string_literal: true

module API
  module V1
    module Rescuers
      extend ActiveSupport::Concern

      included do
        rescue_from Pundit::NotAuthorizedError do |ex|
          render_jsonapi_errors "You are not authorized to perform this action.", 401, ex
        end
        rescue_from ActiveRecord::RecordInvalid, Grape::Exceptions::ValidationErrors do |ex|
          render_jsonapi_errors "Record invalid", 422, ex
        end
        rescue_from ActiveRecord::RecordNotFound do |ex|
          render_jsonapi_errors "Record not found", 404, ex
        end
        rescue_from :all do |ex|
          message = !Rails.env.production? ? ex.message : "Something went wrong"
          render_jsonapi_errors message, 500, ex
        end
      end
    end
  end
end
