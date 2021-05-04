require 'rails_helper'

RSpec.describe "Recommendations", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/recommendations/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/recommendations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/recommendations/create"
      expect(response).to have_http_status(:success)
    end
  end

end
