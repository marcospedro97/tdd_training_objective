# frozen_string_literal: true

module ShoppingCarts
  class AddOrCreateProcessor
    def self.call(user_id:, product_ids:, amount:)
      new(user_id: user_id, product_ids: product_ids, amount: amount).exec
    end

    def initialize(user_id:, product_ids:, amount:)
      @user_id = user_id
      @product_ids = product_ids
      @amount = amount
    end

    def exec
      ShoppingCarts::CreateRepository.call(user: user) if shopping_cart.nil?
      ShoppingCarts::AddProductRepository.call(
        user: user,
        products: products,
        amount: @amount
      )
    end

    def user
      @user ||= Users::FindRepository.call(@user_id)
    end

    def products
      @product ||= Products::FindManyRepository.call(@product_ids)
    end

    def shopping_cart
      @shopping_cart ||= ShoppingCarts::FindRepository.call(user_id: @user_id)
    end
  end
end
