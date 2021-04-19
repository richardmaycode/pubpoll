require 'rails_helper'

RSpec.describe "Polls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/polls/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/polls/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/polls/new"
      expect(response).to have_http_status(:success)
    end
  end

end
