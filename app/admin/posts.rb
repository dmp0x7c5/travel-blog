# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :title, :body, :author_id
end
