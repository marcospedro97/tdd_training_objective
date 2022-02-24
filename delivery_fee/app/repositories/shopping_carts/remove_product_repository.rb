module  ShoppingCarts
  class RemoveProductRepository
    def self.call(shopping_cart:, product_id:, amount:)
      shopping_cart_product = shopping_cart.shopping_cart_products.find_by(product_id: product_id)
      return if shopping_cart_product.nil?

      return shopping_cart_product.destroy if shopping_cart_product.amount - amount.to_i == 0
      shopping_cart_product.update(amount: shopping_cart_product.amount - amount.to_i)
    end
  end
end