module Delivery
  class FeeProcessor
    def self.call(zip_code:, user_id:)
      new(zip_code: zip_code, user_id: user_id).exec
    end

    def initialize(zip_code:, user_id:)
      @zip_code = zip_code
      @user_id = user_id
    end

    def exec
      return 0 if total_price > 100.0

      shopping_cart.shopping_cart_products.map do |shopping_cart_product|
        shopping_cart_product.amount * delivery_fee
      end.sum
    end
  
    def shopping_cart_repository
      ShoppingCarts::FindRepository.new(user_id: @user_id)
    end

    def total_price
      @total_price ||= shopping_cart_repository.total_price
    end

    def shopping_cart
      @shopping_cart ||= shopping_cart_repository.exec
    end

    def delivery_fee
      @delivery_fee ||= Delivery::FeeRepository.call(zip_code: @zip_code)
    end
  end
end