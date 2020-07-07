require 'rails_helper'


RSpec.describe 'GET /v1/products', type: :request do
   let(:products) { create(:product) }
  describe 'Get /v1/products' do
   
    before do
      get '/api/v1/products'
    end

    it 'should return a 200 response' do
      expect(response).to have_http_status 200
    end

    it'should return product' do
      json_response = JSON.parse(response.body)

      expect(json_response['products'].count).to eq 1
    end

  end


end