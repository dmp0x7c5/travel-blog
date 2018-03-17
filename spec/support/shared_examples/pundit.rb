# frozen_string_literal: true

require "pundit/rspec"

shared_examples "grants access" do
  it "grants access" do
    expect(described_class).to permit(user, record)
  end
end

shared_examples "denies access" do
  it "denies access" do
    expect(described_class).not_to permit(user, record)
  end
end

shared_examples "grants access to everybody" do
  context "authenticated" do
    let(:user) { build(:user) }
    it_behaves_like "grants access"
  end

  context "not authenticated" do
    let(:user) { nil }
    it_behaves_like "grants access"
  end
end

shared_context "not authorized" do |policy_class, policy_method, effect = false|
  before do
    policy = instance_double("policy", policy_method => effect)
    allow(policy_class).to receive(:new).and_return(policy)
  end
end

shared_context "authorized" do |policy_class, policy_method, effect = true|
  before do
    policy = instance_double("policy", policy_method => effect)
    allow(policy_class).to receive(:new).and_return(policy)
  end
end
