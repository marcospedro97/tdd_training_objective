# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::FindRepository do
  it 'should find a user' do
    # ARRANGE
    user = create(:user)
    # ACT
    result = Users::FindRepository.call(user.id)
    # ASSERT
    expect(result.id).to eq(user.id)
  end
end
