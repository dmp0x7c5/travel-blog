# frozen_string_literal: true

require "rails_helper"

describe Post do
  describe "validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "relationships" do
    it { is_expected.to belong_to(:author).class_name(:User).required }
  end
end
