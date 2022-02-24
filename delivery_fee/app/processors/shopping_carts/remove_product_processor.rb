module ShoppingCarts
  class RemoveProductProcessor
    def self.call(user_id:, products:)
      new(user_id: user_id, products: products).exec
    end

    def initialize(user_id:, products:)
      @user_id = user_id
      @products = products
    end

    def exec
      @products.each do |product|
        ShoppingCarts::RemoveProductRepository.call(
          shopping_cart: shopping_cart,
          product_id: product[:id],
          amount: product[:amount]
        )
      end
      ShoppingCarts::Destroy.call(shopping_cart: shopping_cart) if shopping_cart_products.empty?
    end

    def shopping_cart_products
      @shopping_cart_products ||= ShoppingCarts::FindProducts.call(shopping_cart: shopping_cart)
    end

    def shopping_cart
      @shopping_cart ||= ShoppingCarts::FindRepository.call(user_id: @user_id)
    end
  end
end