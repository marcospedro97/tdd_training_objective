# frozen_string_literal: true

module ShoppingCarts
  class AddProductRepository
    def self.call(shopping_cart:, product_id:, amount:)
      shopping_cart_product = shopping_cart.shopping_cart_products.
        find_or_create_by(product_id: product_id)
      shopping_cart_product.update!(amount: shopping_cart_product.amount + amount.to_i)
      shopping_cart
    end
  end
end
