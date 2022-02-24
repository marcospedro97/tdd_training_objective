class ShoppingCartProductsController < ApplicationController
  def create
    @shopping_cart = ShoppingCarts::AddOrCreateProcessor.call(user_id: shopping_cart_params[:user_id], products: shopping_cart_params[:products])
    render json: @shopping_cart, status: :created
  end

  def destroy
    ShoppingCarts::RemoveProductProcessor.call(user_id: shopping_cart_params[:user_id], products: shopping_cart_params[:products])
    render json: {}, status: :ok
  end

  private

  def shopping_cart_params
    params.require(:shopping_cart).permit(:user_id, products: [:id, :amount])
  end
end