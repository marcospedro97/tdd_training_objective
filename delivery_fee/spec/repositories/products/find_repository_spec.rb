# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::FindRepository do
  it 'should find a product' do
    # ARRANGE
    product = create(:product)
    # ACT
    result = Products::FindRepository.call(product.id)
    # ASSERT
    expect(result.id).to eq(product.id)
  end
end
