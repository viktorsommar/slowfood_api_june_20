require 'rails_helper'

RSpec.describe 'GET /v1/products', type: :request do
  describe 'successfully gets products' do
    let!(:products) { 3.times{ create(:product) }}
    before do
      get '/api/v1/products'
    end

    it 'should return a 200 response' do
      expect(response).to have_http_status 200
    end

    it'should return product' do
      expect(response_json['products'].count).to eq 3
    end
  end

  describe 'no products have been added' do
    before do
      get '/api/v1/products'
    end
    
    it 'should have no product on page' do
      expect(response_json['products']).to eq []
    end
  end
end