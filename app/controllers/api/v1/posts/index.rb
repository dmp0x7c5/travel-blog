# frozen_string_literal: true

module API
  module V1
    module Posts
      class Index < Base
        desc "Return all posts"
        get do
          authorize Post, :index?
          Post.all
        end
      end
    end
  end
end
