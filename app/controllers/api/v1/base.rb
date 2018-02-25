# frozen_string_literal: true

module API
  module V1
    class Base < Grape::API
      version "v1", using: :path, vendor: "travel-blog"

      # formatter :json, Grape::Formatter::TODO
      content_type :json, "application/vnd.api+json"
      default_format :json

      # include Rescuers
      helpers Pundit

      mount Posts::Base
    end
  end
end
