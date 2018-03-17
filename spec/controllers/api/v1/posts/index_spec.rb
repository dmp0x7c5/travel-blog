# frozen_string_literal: true

require "rails_helper"

describe API::V1::Posts::Index, type: :request do
  describe "GET /api/v1/posts" do
    let(:endpoint) { "/api/v1/posts" }

    subject { get endpoint }

    let!(:post_1) { create(:post) }
    let!(:post_2) { create(:post) }

    context "when authorized" do
      include_context "authorized", PostPolicy, :index?

      let(:response_body) do
        JSONAPI::Serializable::Renderer.new.render(
          [post_1, post_2],
          class: { Post: PostSerializer, User: UserSerializer },
          include: [:author],
        )
      end
      include_examples "status: 200"
    end

    context "when not authorized" do
      include_context "not authorized", PostPolicy, :index?
      it_behaves_like "status: 401"
    end
  end
end
