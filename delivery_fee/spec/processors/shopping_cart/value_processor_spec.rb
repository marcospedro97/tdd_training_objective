# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCarts::ValueProcessor do
  it 'should return the total value of the shopping cart' do
    # ARRANGE
    user = create(:user)
    shopping_cart = create(:shopping_cart, user: user)
    product = create(:product, value: 10.0)
    create(
      :shopping_cart_product,
      shopping_cart: shopping_cart,
      product: product, 
      amount: 2
    )
    # ACT
    result = ShoppingCarts::ValueProcessor.call(user_id: user.id)
    # ASSERT
    expect(result).to eq(20.0)
  end
end
