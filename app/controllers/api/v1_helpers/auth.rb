# frozen_string_literal: true

# TODO: unlock when support doorkeeper
# require "doorkeeper/grape/helpers"

module API
  module V1Helpers
    module Auth
      extend ::Grape::API::Helpers
      # TODO: unlock when support doorkeeper
      # include Doorkeeper::Grape::Helpers

      def current_user
        nil
        # TODO: unlock when support doorkeeper
        # return if doorkeeper_token.nil? || !doorkeeper_token.accessible?
        # @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
