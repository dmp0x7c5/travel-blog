# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  type "users"

  attribute :email
end
