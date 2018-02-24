# frozen_string_literal: true

require "rails_helper"

describe ApplicationController do
  describe "#authenticate_admin_user!" do
    controller do
      def index
        authenticate_admin! && return
        render plain: "admin content"
      end
    end
    let(:env) { "test" }

    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new(env))
      get :index
    end

    context "user not logged in" do
      let(:user) { nil }

      it "redirects to sign in page" do
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "user logged in" do
      context "user is not an admin" do
        let(:user) { build(:user) }

        it "redirects to frontend_host" do
          expect(response).to redirect_to Rails.application.secrets.frontend_url
        end
      end

      context "user is an admin" do
        let(:user) { build(:user, :admin) }

        it "renders admin content" do
          expect(response.body).to eq("admin content")
        end
      end
    end
  end
end
