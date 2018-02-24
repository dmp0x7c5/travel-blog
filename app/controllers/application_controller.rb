# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Set by config.authentication_method in config/initializers/active_admin.rb
  def authenticate_admin!
    return redirect_to new_user_session_path if current_user.blank?
    redirect_to frontend_url unless current_user.admin?
  end

  def frontend_url
    Rails.application.secrets.frontend_url
  end
end
