# frozen_string_literal: true

require "rails_helper"

describe PostSerializer do
  let(:post) { build_stubbed(:post) }
  subject do
    JSONAPI::Serializable::Renderer.new.render(
      post, class: { Post: PostSerializer, User: UserSerializer }
    )
  end

  it "renders attributes" do
    s = subject
    expect(s[:data][:type]).to eq :posts
    expect(s[:data][:attributes].keys).to eq [:title, :body, :created_at]
  end

  it "renders relationships" do
    s = subject
    expect(s[:data][:relationships].keys).to eq [:author]
  end
end
