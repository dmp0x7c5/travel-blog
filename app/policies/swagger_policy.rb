# frozen_string_literal: true

class SwaggerPolicy < ApplicationPolicy
  def show?
    return true if Rails.env.development?
    user&.admin?
  end
end
