require 'rails_helper'

RSpec.describe "Api::v1::Orders", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/orders/create"
      expect(response).to have_http_status(:success)
    end
  end

end
