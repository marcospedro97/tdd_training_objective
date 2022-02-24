require 'rails_helper'

RSpec.describe ShoppingCarts::CreateRepository do
  it 'should create a new shopping cart' do
    # ARRANGE
    user = create(:user)
    # ACT
    shopping_cart = ShoppingCarts::CreateRepository.call(user: user)
    # ASSERT
    expect(user.shopping_cart).to be_present
    expect(user.shopping_cart.products).to be_empty 
    expect(shopping_cart.user).to eq(user)
    expect(shopping_cart.is_active).to be_truthy
  end
end