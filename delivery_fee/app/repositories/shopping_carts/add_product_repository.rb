# frozen_string_literal: true

module ShoppingCarts
  class AddProductRepository
    def self.call(user:, products:, amount:)
      shopping_cart = user.shopping_carts.find(is_active: true)
      shopping_cart_product = shopping_cart.shopping_cart_products.
        find_or_create_by(product: products)
      shopping_cart_product.each {|sp| sp.update(amount: shopping_cart_product.amount + amount)
      shopping_cart
    end
  end
end
