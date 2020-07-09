RSpec.describe Api::V1::OrdersController, type: :request do
  let!(:product_1) { create(:product, name: 'Pokebowl') }
  let!(:product_2) { create(:product, name: 'Burger') }

  it 'responds with success message' do
    post '/api/v1/orders', params: {id: product_1.id }
    expect(JSON.parse(response.body)['message']).to eq 'The product has been added to your order'
  end
end