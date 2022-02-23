# frozen_string_literal: true

class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_products, dependent: :destroy
  has_many :products, through: :shopping_cart_products
end
