# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCarts::AddProductRepository do
  it 'should be able to add a product to a shopping cart' do
    # ARRANGE
    user = create(:user)
    shopping_cart = create(:shopping_cart, user: user)
    product = create(:product)
    # ACT
    repository = ShoppingCarts::AddProductRepository.call(
      shopping_cart: shopping_cart,
      product_id: product.id,
      amount: 1
    )

    expect(shopping_cart.products.count).to eq(1)
  end
end
