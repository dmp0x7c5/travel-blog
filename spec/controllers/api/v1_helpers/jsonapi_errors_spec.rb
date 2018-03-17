# frozen_string_literal: true

require "rails_helper"

describe API::V1Helpers::JsonapiErrors, type: :request do
  class API::V1::Base < Grape::API
    get "rspec-single-error" do
      render_jsonapi_errors("Message", 422)
    end

    get "rspec-hash-error" do
      errors_hash = {
        email: ["is invalid"],
        password_confirmation: ["doesn't match Password"],
        password: ["is too short (minimum is 6 characters)", "sth is wrong"],
      }

      render_jsonapi_errors(errors_hash, 500)
    end
  end

  let(:expected_body) { expected_errors.to_json }
  subject { get endpoint }
  before { subject }

  shared_examples "renders errors" do
    it "returns proper structure" do
      expect(response).to have_http_status(status)
      expect(response.body).to eq(expected_body)
    end
  end

  context "when returning single errors message" do
    let(:endpoint) { "/api/v1/rspec-single-error" }

    let(:title) { "Message" }
    let(:status) { 422 }
    let(:expected_errors) { { errors: [{ title: title }] } }

    it_behaves_like "renders errors"
  end

  context "when returning hash errors" do
    let(:endpoint) { "/api/v1/rspec-hash-error" }
    let(:status) { 500 }
    let(:expected_errors) do
      {
        errors:
          [
            {
              title: :email,
              detail: "Email is invalid",
            },
            {
              title: :password_confirmation,
              detail: "Password confirmation doesn't match Password",
            },
            {
              title: :password,
              detail: "Password is too short (minimum is 6 characters)",
            },
            {
              title: :password,
              detail: "Password sth is wrong",
            },
          ],
      }
    end

    it_behaves_like "renders errors"
  end
end
