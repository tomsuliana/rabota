require 'rails_helper'

RSpec.describe "Exams", type: :request do
  describe "GET /cabinet" do
    it "returns http success" do
      get "/exam/cabinet"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /exam_process" do
    it "returns http success" do
      get "/exam/exam_process"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /exam_result" do
    it "returns http success" do
      get "/exam/exam_result"
      expect(response).to have_http_status(:success)
    end
  end

end
