# frozen_string_literal: true

class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
