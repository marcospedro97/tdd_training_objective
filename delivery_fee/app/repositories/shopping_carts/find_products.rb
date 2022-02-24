module ShoppingCarts
  class FindProducts
    def self.call(shopping_cart:)
      ShoppingCartProduct.where(shopping_cart: shopping_cart)
    end
  end
end