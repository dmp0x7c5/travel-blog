# frozen_string_literal: true

module API
  module V1
    module Posts
      class Base < Grape::API
        namespace :posts do
          mount Index
        end
      end
    end
  end
end
