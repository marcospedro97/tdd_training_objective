module ShoppingCarts
  class CreateRepository
    def self.call(user:)
      user.shopping_carts.create(is_active: true)
    end
  end
end