# frozen_string_literal: true

module API
  module V1Helpers
    module JsonapiRender
      extend ::Grape::API::Helpers

      def renderer
        JSONAPI::Serializable::Renderer.new
      end
    end
  end
end
