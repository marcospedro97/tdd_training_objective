require 'rails_helper'

RSpec.describe Delivery::FeeRepository do
  it 'should return a delivery fee value' do
    # ARRANGE
    user = create(:user)
    # ACT
    result = Delivery::FeeRepository.call(zip_code: user.zip_code)
    # ASSERT
    expect(result).to eq(10.0)
  end
end