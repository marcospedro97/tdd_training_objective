module ShoppingCarts
  class Destroy
    def self.call(shopping_cart:)
      new(shopping_cart: shopping_cart).exec
    end

    def initialize(shopping_cart:)
      @shopping_cart = shopping_cart
    end

    def exec
      @shopping_cart.update!(is_active: false)
    end
  end
end