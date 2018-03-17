# frozen_string_literal: true

require "rails_helper"

describe "API: Rescuers concern", type: :request do
  class API::V1::Base < Grape::API
    get "rspec-exception-test" do
    end
  end

  let(:endpoint) { "/api/v1/rspec-exception-test" }
  let(:exception_message) { FFaker::Lorem.sentence }
  subject { get endpoint }

  before do
    allow_any_instance_of(Grape::Request).to receive(:params).and_raise(exception)
    allow(Rails.env).to receive(:production?).and_return(production_flag)

    subject
  end

  shared_examples "verbose error messages" do
    it "responds with proper code and verbose errors" do
      expect(response).to have_http_status(status)

      rsp = JSON.parse(response.body)["errors"].first
      expect(rsp).to have_key("backtrace")
      expect(rsp["description"]).to eq(exception_message)
      expect(rsp["klass"]).to eq(exception.class.to_s)
      expect(rsp["title"]).to eq(message)
    end
  end

  shared_examples "short error messages" do
    it "responds with proper code and errors" do
      expect(response).to have_http_status(status)

      response_body = { errors: [{ title: message }] }.to_json
      expect(response.body).to eq(response_body)
    end
  end

  shared_examples "renders verbose errors for non-production and short for production env" do
    context "and in non-production env" do
      let(:production_flag) { false }
      include_examples "verbose error messages"
    end

    context "and in production env" do
      let(:production_flag) { true }
      include_examples "short error messages"
    end
  end

  describe "accessing API resource" do
    context "when dealing with Pundit::NotAuthorizedError exception" do
      let(:exception) { Pundit::NotAuthorizedError.new(exception_message) }
      let(:message) { "You are not authorized to perform this action." }
      let(:status) { 401 }

      include_examples "renders verbose errors for non-production and short for production env"
    end

    context "when dealing with ActiveRecord::RecordInvalid exception" do
      let(:exception) { ActiveRecord::RecordInvalid.new }
      let(:exception_message) { "Record invalid" }
      let(:message) { "Record invalid" }
      let(:status) { 422 }

      include_examples "renders verbose errors for non-production and short for production env"
    end

    context "when dealing with Grape::Exceptions::ValidationErrors exception" do
      let(:exception) { Grape::Exceptions::ValidationErrors.new }
      let(:exception_message) { "" }
      let(:message) { "Record invalid" }
      let(:status) { 422 }

      include_examples "renders verbose errors for non-production and short for production env"
    end

    context "when dealing with ActiveRecord::RecordNotFound exception" do
      let(:exception) { ActiveRecord::RecordNotFound.new(exception_message) }
      let(:message) { "Record not found" }
      let(:status) { 404 }

      include_examples "renders verbose errors for non-production and short for production env"
    end

    context "when dealing with RuntimeError exception" do
      let(:exception) { RuntimeError.new(exception_message) }
      let(:status) { 500 }

      context "and in non-production env" do
        let(:production_flag) { false }
        let(:message) { exception_message }

        include_examples "verbose error messages"
      end

      context "and in production env" do
        let(:message) { "Something went wrong" }
        let(:production_flag) { true }

        include_examples "short error messages"
      end
    end
  end
end
