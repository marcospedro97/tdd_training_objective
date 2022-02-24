require 'rails_helper'

RSpec.describe ShoppingCarts::RemoveProductProcessor do
  it 'should call remove_product_repository' do
    # ARRANGE
    user = build_stubbed(:user)
    product = build_stubbed(:product)
    shopping_cart = build_stubbed(:shopping_cart, user: user)
    build_stubbed(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 1)
    allow(ShoppingCarts::FindRepository).to receive(:call).and_return(shopping_cart)
    allow(ShoppingCarts::Destroy).to receive(:call).and_return(true)
    allow(ShoppingCarts::FindProducts).to receive(:call).and_return([])
    expect(ShoppingCarts::RemoveProductRepository).to receive(:call).with(
      shopping_cart: shopping_cart,
      product_id: product.id,
      amount: 1
    )
    # ACT
    ShoppingCarts::RemoveProductProcessor.call(
      user_id: user.id,
      products: [
        { id: product.id, amount: 1 }
      ]
    )
    # ASSERT
    expect(shopping_cart.shopping_cart_products.count).to eq(0)
  end
end