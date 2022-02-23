# frozen_string_literal: true

module ShoppingCarts
  class FindRepository
    def self.call(user_id:)
      ShoppingCart.includes(:shopping_cart_products, :products).
        references(:shopping_cart_products, :products).find_by(
          user_id: user_id, is_active: true
        )
    end
  end
end
