RSpec.describe 'PUT /api/v1/orders', type: :request do
    let!(:pizza) { create(:product, name: 'Pizza', price: 50) }
    let!(:falafel) { create(:product, name: 'Falafel', price: 60) }
    let!(:mushrooms) { create(:product, name: 'Swamp', price: 3) }

    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:user_headers) { { HTTP_ACCEPT: 'application/json'}.merge!(credentials) }

    let(:order) { create(:order, user: user) }
    let!(:order_item) { 3.times{create(:order_item, product: pizza, order: order) } }
    let!(:more_order_item) { 5.times{create(:order_item, product: falafel, order: order) } }

    describe 'successfully' do
      before do 
        put "/api/v1/orders/#{order.id}",
        params: { product_id: mushrooms.id },
        headers: user_headers
      end

      it 'responds with 200 status' do
        expect(response.status).to eq 200
      end

      it 'responds with success message' do
        expect(response_json['message']).to eq 'The product has been added to your order'
      end

      it 'responds with order_id ' do 
        expect(response_json['order']['id']).to eq order.id
      end

      it "responds with the right amount of products currently in the order" do
        expect(response_json['order']['products'].count).to eq 3
      end
    
      it "responds with current order total" do
        expect(response_json['order']['total']).to eq 453
      end
  end
end