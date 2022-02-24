# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCarts::AddOrCreateProcessor do
  it 'should call ShoppingCarts::AddProductRepository' do
    # ARRANGE
    user = build_stubbed(:user)
    product = build_stubbed(:product)
    shopping_cart = build_stubbed(:shopping_cart, user: user, is_active: true)
    allow(Users::FindRepository).to receive(:call).and_return(user)
    allow(Products::FindRepository).to receive(:call).and_return(product)
    allow(ShoppingCarts::FindRepository).to receive(:call).and_return(shopping_cart)
    # ACT
    expect(ShoppingCarts::AddProductRepository).to receive(:call).with(
      shopping_cart: shopping_cart,
      product_id: product.id,
      amount: 2
    )
    ShoppingCarts::AddOrCreateProcessor.call(
      user_id: user.id,
      products: [{ id: product.id, amount: 2 }]
    )
  end

  it 'should create a shopping_cart if it does not exist' do
    # ARRANGE
    user = build_stubbed(:user)
    product = build_stubbed(:product)
    allow(Users::FindRepository).to receive(:call).and_return(user)
    allow(ShoppingCarts::AddProductRepository).to receive(:call).and_return(nil)
    expect(ShoppingCarts::CreateRepository).to receive(:call).with(
      user: user
    )
    ShoppingCarts::AddOrCreateProcessor.call(
      user_id: user.id,
      products: [{ id: product.id, amount: 2 }]
    )
  end
end
