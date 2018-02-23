# frozen_string_literal: true

require "rails_helper"

describe User do
  let(:user) { create(:user) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:role) }
  end

  describe "defaults" do
    it "user role is :user" do
      expect(user.role).to eq "regular_user"
    end
  end

  describe "defined user roles" do
    it "has specific roles" do
      expect(described_class.roles)
        .to eq(
          "admin" => 1,
          "regular_user" => 0,
        )
    end
  end
end
