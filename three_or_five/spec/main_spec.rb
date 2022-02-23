# frozen_string_literal: true

require 'spec_helper'
require_relative '../main'

RSpec.describe Main do
  it 'should return all multiples of 5 or 3 smaller than 10' do
    expect(Main.call(max: 10, divisors: [3, 5])).to eq([3, 5, 6, 9])
  end

  it 'should return the sum of all multiples of 5 or 3 smaller than 10' do
    expect(Main.call(max: 10, divisors: [3, 5], method: :sum)).to eq(23)
  end

  it 'should return the sum of all multiples of 5 or 3 smaller than 1000' do
    expect(Main.call(max: 1000, divisors: [3, 5], method: :sum)).to eq(233_168)
  end

  it 'should return all multiples of 5, 3 or 7 smaller than 10' do
    expect(Main.call(max: 10, divisors: [3, 5, 7])).to eq([3, 5, 6, 7, 9])
  end
end
