# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::FindManyRepository do
  it 'should find a product' do
    # ARRANGE
    product = create(:product)
    # ACT
    result = Products::FindManyRepository.call(product.id)
    # ASSERT
    expect(result.first.id).to eq(product.id)
  end
end
