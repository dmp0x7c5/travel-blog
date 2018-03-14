# frozen_string_literal: true

class PostSerializer < ApplicationSerializer
  type "posts"

  attributes :title, :body, :created_at
  belongs_to :author
end
