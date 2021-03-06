# frozen_string_literal: true

module ShoppingCarts
  class AddOrCreateProcessor
    def self.call(user_id:, products:)
      new(user_id: user_id, products: products).exec
    end

    def initialize(user_id:, products:)
      @user_id = user_id
      @products = products
    end

    def exec
      create_repository.call(user: user) if shopping_cart.nil?
      @products.each do |product|
        add_product_repository.call(
          shopping_cart: shopping_cart,
          product_id: product[:id],
          amount: product[:amount]
        )
      end
    end

    def add_product_repository
      ShoppingCarts::AddProductRepository
    end

    def create_repository
      ShoppingCarts::CreateRepository
    end

    def user
      @user ||= Users::FindRepository.call(@user_id)
    end

    def shopping_cart
      @shopping_cart ||= ShoppingCarts::FindRepository.call(user_id: @user_id)
    end
  end
end
