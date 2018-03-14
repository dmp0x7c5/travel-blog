# frozen_string_literal: true

module API
  module V1
    module Posts
      class Index < Base
        desc "Return all posts with author included"

        get do
          authorize Post, :index?

          renderer.render(
            Post.all,
            class: { Post: PostSerializer, User: UserSerializer },
            include: [:author],
          )
        end
      end
    end
  end
end
