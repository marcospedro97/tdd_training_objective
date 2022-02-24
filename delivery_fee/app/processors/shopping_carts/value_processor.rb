# frozen_string_literal: true

module ShoppingCarts
  class ValueProcessor
    def self.call(user_id:)
      new(user_id: user_id).exec
    end

    def initialize(user_id:)
      @user_id = user_id
    end

    def exec
      shopping_cart = repository.call(user_id: @user_id)
      return 0.0 if shopping_cart.nil?
      return 0.0 if shopping_cart.products.empty?
      
      value = shopping_cart.shopping_cart_products.map do |p|
        p.product.value * p.amount
      end.sum
    end

    private

    def repository
      ShoppingCarts::FindRepository
    end
  end
end
