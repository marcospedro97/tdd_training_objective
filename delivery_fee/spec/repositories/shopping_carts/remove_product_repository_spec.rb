require 'rails_helper'

RSpec.describe ShoppingCarts::RemoveProductRepository do
  it 'should remove product from shopping cart if amount gets to zero' do
    product = create(:product)
    shopping_cart = create(:shopping_cart, user: create(:user))
    create(:shopping_cart_product, product: product, amount: 1, shopping_cart: shopping_cart)
    ShoppingCarts::RemoveProductRepository.call(
      shopping_cart: shopping_cart,
      product_id: product.id,
      amount: 1
    )
    expect(shopping_cart.shopping_cart_products.empty?).to eq(true)
  end

  it 'should remove only the amount of the product that is requested' do
    product = create(:product)
    shopping_cart = create(:shopping_cart, user: create(:user))
    create(:shopping_cart_product, product: product, amount: 3, shopping_cart: shopping_cart)
    ShoppingCarts::RemoveProductRepository.call(
      shopping_cart: shopping_cart,
      product_id: product.id,
      amount: 2
    )
    expect(shopping_cart.shopping_cart_products.first.amount).to eq(1)
  end
end