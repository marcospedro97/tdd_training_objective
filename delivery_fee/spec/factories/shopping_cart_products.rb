# frozen_string_literal: true

FactoryBot.define do
  factory :shopping_cart_product do
    product { nil }
    shopping_cart { nil }
    amount { 1 }
  end
end
