# frozen_string_literal: true

require "rails_helper"

describe SwaggerPolicy do
  permissions :show? do
    before do
      allow(Rails.env).to receive(:development?).and_return(development_flag)
    end
    let(:record) { :swagger }

    context "in development env" do
      let(:development_flag) { true }

      context "when admin user" do
        let(:user) { build(:user, :admin) }
        it_behaves_like "grants access"
      end

      context "when regular user" do
        let(:user) { build(:user) }

        it_behaves_like "grants access"
      end

      context "when nonauthenticated" do
        let(:user) { nil }

        it_behaves_like "grants access"
      end
    end

    context "in non-development env" do
      let(:development_flag) { false }

      context "when admin user" do
        let(:user) { build(:user, :admin) }
        it_behaves_like "grants access"
      end

      context "when regular user" do
        let(:user) { build(:user) }

        it_behaves_like "denies access"
      end

      context "when nonauthenticated" do
        let(:user) { nil }

        it_behaves_like "denies access"
      end
    end
  end
end
