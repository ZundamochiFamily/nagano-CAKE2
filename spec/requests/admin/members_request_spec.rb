require 'rails_helper'

RSpec.describe "Admin::Members", type: :request do

  describe "GET /genres" do
    it "returns http success" do
      get "/admin/members/genres"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /items" do
    it "returns http success" do
      get "/admin/members/items"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /orders" do
    it "returns http success" do
      get "/admin/members/orders"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /ordered_items" do
    it "returns http success" do
      get "/admin/members/ordered_items"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /homes" do
    it "returns http success" do
      get "/admin/members/homes"
      expect(response).to have_http_status(:success)
    end
  end

end
