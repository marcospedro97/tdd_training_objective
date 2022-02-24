require 'spec_helper'
require_relative '../main'

RSpec.describe Main do
  it 'should return value of word' do
    expect(Main.call(word: 'aaa')).to eq(3)
  end

  it 'should return true if word is prime' do
    expect(Main.call(word: 'aaa', method: :prime)).to eq(true)
  end

  it 'should return false if word is prime' do
    expect(Main.call(word: 'aaaa', method: :prime)).to eq(false)
  end

  it 'should return true if word is multiple of three or five' do
    expect(Main.call(word: 'aaa', method: :multiple_of_three_or_five?)).to eq(true)
  end

  it 'should return false if word is multiple of three or five' do
    expect(Main.call(word: 'aaaa', method: :multiple_of_three_or_five?)).to eq(false)
  end

  it 'should return true if word value is a happy number' do
    expect(Main.call(word: 'g', method: :is_happy?)).to eq(true)
  end


  it 'should return false if word value is a happy number' do
    expect(Main.call(word: 'h', method: :is_happy?)).to eq(false)
  end
end