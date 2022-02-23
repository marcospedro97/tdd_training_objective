# frozen_string_literal: true

class ShoppingCartsController < ApplicationControll
  before_action :authenticate_user!

  def add_or_create
    ShoppingCarts::AddOrCreateProcessor.call(shopping_cart_params)
  end

  def value
    ShoppingCarts::ValueProcessor.call(current_user.id)
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:user_id, products: %i[id, amount], :amount)
  end
end
