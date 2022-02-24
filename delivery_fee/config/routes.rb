# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  scope :api, responds_to: :json do
    resources :shopping_carts, only: %i[] do
      collection do
        get :value
        resources :shopping_cart_products, only: %i[destroy create]
      end
    end
  end
end
