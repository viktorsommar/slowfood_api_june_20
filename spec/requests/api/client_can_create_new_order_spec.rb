RSpec.describe Api::V1::OrdersController, type: :request do
  let!(:product_1) { create(:product, name: 'Pokebowl') }
  let!(:product_2) { create(:product, name: 'Burger') }

  before do 
    post 'v1/api/orders', params: { id: product_1.id }
    @order = Order.last
  end

  it 'adds product to order if param "order_id" is present' do
    post 'v1/api/orders', params: {id: product_2.id, order_id: @order.id}
    expec(@order.order_items.count).to eq 2
  end

  it 'adds another product to order if param "order_id" is present' do
    put "v1/api/orders/#{order.id}", params: {product_id: product_2.id }
    expect(@order.order_items.count).to eq 2
  end

  it 'responds with success message' do
    post 'v1/api/orders', params: {id: product_1.id }
    expect(JSON.parse(response.body)['message']).to eq 'The product has been added to your order'
  end
end