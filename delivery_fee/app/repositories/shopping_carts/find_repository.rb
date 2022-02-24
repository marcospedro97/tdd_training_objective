# frozen_string_literal: true

module ShoppingCarts
  class FindRepository
    def self.call(user_id:, method: :exec)
      new(user_id: user_id).send(method)
    end

    def initialize(user_id:)
      @user_id = user_id
    end

    def exec
      @exec ||= ShoppingCart.includes(:shopping_cart_products, :products).
        references(:shopping_cart_products, :products).find_by(
          user_id: @user_id, is_active: true
        )
    end

    def total_price
      @total_price ||= exec.shopping_cart_products.map do |shopping_cart_product|
        shopping_cart_product.amount * shopping_cart_product.product.value
      end.sum
    end
  end
end
