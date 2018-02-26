# frozen_string_literal: true

Rails.application.routes.draw do
  mount API::Root, at: "/"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/" => redirect(Rails.application.secrets.frontend_url)
  mount GrapeSwaggerRails::Engine => "/swagger"
end
