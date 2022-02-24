require 'rails_helper'

RSpec.describe 'shopping cart' do
  it 'should return the value of a shopping cart' do
    user = create(:user)
    product = create(:product, value: 10)
    shopping_cart = create(:shopping_cart, user: user)
    shopping_cart_product = create(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 2)

    json_response = get value_shopping_carts_path(params: { user_id: user.id })
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:ok)
    expect(json[:value].to_f).to eq(20.0)
  end
end