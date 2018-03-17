# frozen_string_literal: true

require "rails_helper"

describe UserSerializer do
  let(:user) { build_stubbed(:user) }
  subject do
    JSONAPI::Serializable::Renderer.new.render(
      user, class: { User: UserSerializer }
    )
  end

  it "renders attributes" do
    s = subject
    expect(s[:data][:type]).to eq :users
    expect(s[:data][:attributes].keys).to eq [:email]
  end
end
