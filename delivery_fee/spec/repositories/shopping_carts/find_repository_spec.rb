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
end
