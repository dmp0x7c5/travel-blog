# frozen_string_literal: true

module API
  module V1
    class Base < Grape::API
      version "v1", using: :path, vendor: "travel-blog"

      content_type :json, "application/vnd.api+json"
      default_format :json

      include Rescuers

      helpers Pundit
      helpers V1Helpers::Auth
      helpers V1Helpers::JsonapiErrors
      helpers V1Helpers::JsonapiRender

      mount Posts::Base
    end
  end
end
