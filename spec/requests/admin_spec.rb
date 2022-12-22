require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /panel" do
    it "returns http success" do
      get "/admin/panel"
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /control_users" do
    it "returns http success" do
      get "/admin/control_users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /control_questions" do
    it "returns http success" do
      get "/admin/control_questions"
      expect(response).to have_http_status(:success)
    end
  end

end
