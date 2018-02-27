# frozen_string_literal: true

require "rails_helper"

describe "root path redirection" do
  subject { get "/" }

  it "redirects to frontend host" do
    expect(subject).to redirect_to(Rails.application.secrets.frontend_url)
  end
end
