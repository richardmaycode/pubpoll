require 'rails_helper'

RSpec.describe "Claimants", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/claimants/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/claimants/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/claimants/create"
      expect(response).to have_http_status(:success)
    end
  end

end
