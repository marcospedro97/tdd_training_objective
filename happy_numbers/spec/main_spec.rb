# frozen_string_literal: true

require 'spec_helper'
require_relative '../main'

RSpec.describe Main do
  it 'should return true if the number is happy' do
    expect(Main.call(7)).to eq true
  end

  it 'should return false if the number is not happy' do
    expect(Main.call(8)).to eq false
  end
end
