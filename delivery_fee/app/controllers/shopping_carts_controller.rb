# frozen_string_literal: true

class ShoppingCartsController < ApplicationController
  def value
    @value = ShoppingCarts::ValueProcessor.call(user_id: params[:user_id])
    render json: { value: @value }, status: :ok
  end
end
