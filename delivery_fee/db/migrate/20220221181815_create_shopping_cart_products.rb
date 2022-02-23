# frozen_string_literal: true

class CreateShoppingCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_cart_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
