# frozen_string_literal: true

module Products
  class FindManyRepository
    def self.call(product_ids)
      Product.where(id: product_ids)
    end
  end
end
