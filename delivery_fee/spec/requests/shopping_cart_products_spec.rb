require 'rails_helper'

RSpec.describe 'shopping cart' do
  it 'should create a shopping cart' do
    user = create(:user)
    product = create(:product, value: 10)
    # ACT
    post shopping_cart_products_path params: { shopping_cart: { user_id: user.id, products: [{ id: product.id, amount: 2}] } }
    # ASSERT
    expect(response).to have_http_status(:created)
    expect(user.shopping_carts).to be_present
    expect(user.shopping_carts.first.products.first).to be_present
  end

  it 'should add to existing shopping cart' do
    user = create(:user)
    product = create(:product, value: 10)
    shopping_cart = create(:shopping_cart, user: user)
    post shopping_cart_products_path params: { shopping_cart: { user_id: user.id, products: [{ id: product.id, amount: 2}] } }

    expect(response).to have_http_status(:created)
    expect(user.shopping_carts.count).to eq(1)
    expect(user.shopping_carts.first.products.first).to eq(product)
    expect(user.shopping_carts.first.shopping_cart_products.first.amount).to eq(2)
  end

  it 'should remove from existing shopping cart' do
    user = create(:user)
    product = create(:product, value: 10)
    shopping_cart = create(:shopping_cart, user: user)
    shopping_cart_product = create(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 2)
    delete shopping_cart_product_path(shopping_cart_product.id), params: { shopping_cart: { user_id: user.id, products: [{ id: product.id, amount: 1}] } }

    expect(response).to have_http_status(:ok)
    expect(user.shopping_carts.count).to eq(1)
    expect(user.shopping_carts.first.products.first).to eq(product)
    expect(user.shopping_carts.first.shopping_cart_products.first.amount).to eq(1)
  end

  it 'should remove relation if amount gets to 0' do
    user = create(:user)
    product = create_list(:product, 2, value: 10)
    shopping_cart = create(:shopping_cart, user: user)
    shopping_cart_product = create(:shopping_cart_product, shopping_cart: shopping_cart, product: product.first, amount: 1)
    create(:shopping_cart_product, shopping_cart: shopping_cart, product: product.last, amount: 1)
    delete shopping_cart_product_path(shopping_cart_product.id), params: { shopping_cart: { user_id: user.id, products: [{ id: product.first.id, amount: 1}] } }

    expect(response).to have_http_status(:ok)
    expect(user.shopping_carts.count).to eq(1)
    expect(user.shopping_carts.first.products.count).to eq(1)
    expect(user.shopping_carts.first.shopping_cart_products.count).to eq(1)
  end

  it 'should remove shopping cart if gets out of products' do
    user = create(:user)
    product = create(:product, value: 10)
    shopping_cart = create(:shopping_cart, user: user)
    shopping_cart_product = create(:shopping_cart_product, shopping_cart: shopping_cart, product: product, amount: 1)
    delete shopping_cart_product_path(shopping_cart_product.id), params: { shopping_cart: { user_id: user.id, products: [{ id: product.id, amount: 1}] } }

    expect(response).to have_http_status(:ok)
    expect(user.shopping_carts.count).to eq(1)
    expect(user.shopping_carts.first.products.count).to eq(0)
    expect(shopping_cart.reload.is_active).to eq(false)
  end
end