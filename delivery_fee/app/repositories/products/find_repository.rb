# frozen_string_literal: true

module Products
  class FindRepository
    def self.call(product_id)
      Product.find(product_id)
    end
  end
end
