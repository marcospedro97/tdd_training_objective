# frozen_string_literal: true

class User < ApplicationRecord
  has_many :shopping_carts
  has_many :shopping_cart_products, through: :shopping_carts
end
