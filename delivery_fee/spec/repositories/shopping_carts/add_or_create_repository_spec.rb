# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe ShoppingCarts::AddOrCreateRepository do
#   it 'should add a product to a existing shopping cart' do
#     # ARRANGE
#     user = create(:user)
#     product = create(:product)
#     shopping_cart = create(:shopping_cart, user: user, is_active: true)
#     # ACT
#     result = ShoppingCarts::AddOrCreateRepository.call(
#       user: user,
#       product: product, 
#       amount: 2
#     )
#     # ASSERT
#     expect(result.shopping_cart_products.count).to eq(1)
#     expect(result.shopping_cart_products.first.amount).to eq(2)
#     expect(shopping_cart.id).to eq(result.id)
#   end

#   it 'should create a new shopping cart if there is no active shopping cart' do
#     # ARRANGE
#     user = create(:user)
#     product = create(:product)
#     shopping_cart = create(:shopping_cart, user: user, is_active: false)
#     # ACT
#     result = ShoppingCarts::AddOrCreateRepository.call(
#       user: user,
#       product: product, 
#       amount: 2
#     )
#     # ASSERT
#     expect(shopping_cart.id).not_to eq(result.id)
#   end

#   it 'should increase the amount of a product in a shopping cart' do
#     # ARRANGE
#     user = create(:user)
#     product = create(:product)
#     shopping_cart = create(:shopping_cart, user: user, is_active: true)
#     shopping_cart.shopping_cart_products.create(product: product, amount: 2)
#     # ACT
#     result = ShoppingCarts::AddOrCreateRepository.call(
#       user: user,
#       product: product, 
#       amount: 2
#     )
#     # ASSERT
#     expect(result.shopping_cart_products.count).to eq(1)
#     expect(result.shopping_cart_products.first.amount).to eq(4)
#   end

#   it 'should create many shopping cart products' do
#     user = create(:user)
#     products = create_list(:product, 3)
#     shopping_cart = create(:shopping_cart, user: user, is_active: true)
#     # ACT
#     result = ShoppingCarts::AddOrCreateRepository.call(
#       user: user,
#       product: products,
#       amount: [1, 2, 3]
#     )
#     # ASSERT
#     expect(result.shopping_cart_products.count).to eq(3)
#   end
# end
