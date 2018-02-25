# frozen_string_literal: true

Rails.application.routes.draw do
  mount API::Root, at: "/"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount GrapeSwaggerRails::Engine => "/swagger"
end
