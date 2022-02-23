# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCarts::AddOrCreateProcessor do
  it 'should call ShoppingCarts::AddOrCreateRepository' do
    # ARRANGE
    user = build_stubbed(:user)
    product = build_stubbed(:product)
    shopping_cart = build_stubbed(:shopping_cart, user: user, is_active: true)
    allow(Users::FindRepository).to receive(:call).and_return(user)
    allow(Products::FindManyRepository).to receive(:call).and_return(product)
    allow(ShoppingCarts::CreateRepository).to receive(:call).and_return(shopping_cart)
    # ACT
    expect(ShoppingCarts::AddProductRepository).to receive(:call).with(
      user: user, 
      products: product,
      amount: 2
    )
    ShoppingCarts::AddOrCreateProcessor.call(
      user_id: user,
      product_ids: product.id, 
      amount: 2
    )
  end
end
