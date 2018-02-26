# frozen_string_literal: true

require "rails_helper"

describe PostPolicy do
  permissions :index? do
    let(:record) { nil }

    it_behaves_like "grants access to everybody"
  end
end
