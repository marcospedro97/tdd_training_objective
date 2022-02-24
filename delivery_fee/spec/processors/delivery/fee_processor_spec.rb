require 'rails_helper'

RSpec.describe Delivery::FeeProcessor do
  it 'should return a delivery fee value if cart products value < 100' do
    # ARRANGE
    user = create(:user)
    product = create(:product, value: 10)
    shopping_cart = create(:shopping_cart, user: user)
    create(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 2)
    # ACT
    result = Delivery::FeeProcessor.call(zip_code: user.zip_code, user_id: user.id)
    # ASSERT
    expect(result).to eq(20.0)
  end

  it 'should return 0 if cart products value > 100' do
    # ARRANGE
    user = create(:user)
    product = create(:product, value: 100)
    shopping_cart = create(:shopping_cart, user: user)
    create(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 2)
    # ACT
    result = Delivery::FeeProcessor.call(zip_code: user.zip_code, user_id: user.id)
    # ASSERT
    expect(result).to eq(0.0)
  end
end