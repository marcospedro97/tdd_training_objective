# frozen_string_literal: true
require 'prime'
require_relative '../happy_numbers/happy_numbers'

class Main
  def self.call(word:, method: :exec)
    Main.new(word: word).send(method)
  end

  def initialize(word:)
    @word = word
    @arr = ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def exec
    @word.split('').map do |char|
      @arr.find_index(char) + 1
    end.sum
  end

  def prime
    Prime.prime? exec
  end

  def multiple_of_three_or_five?
    exec.modulo(3).zero? || exec.modulo(5).zero?
  end

  def is_happy?
    HappyNumbers.call(exec)
  end
end
