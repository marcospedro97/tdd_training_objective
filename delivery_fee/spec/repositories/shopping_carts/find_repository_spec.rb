# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCarts::FindRepository do
  it 'should find a shopping_cart' do
    # ARRANGE
    user = create(:user)
    shopping_cart = create(:shopping_cart, user: user)
    # ACT
    result = ShoppingCarts::FindRepository.call(user_id: user.id)
    # ASSERT
    expect(result.id).to eq(shopping_cart.id)
  end

  it 'should return the total value of a shopping cart' do
    # ARRANGE
    user = create(:user)
    shopping_cart = create(:shopping_cart, user: user)
    product = create(:product, value: 10)
    create(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 2)
    # ACT
    result = ShoppingCarts::FindRepository.call(user_id: user.id, method: :total_price)
    # ASSERT
    expect(result).to eq(product.value * 2)
  end
end
