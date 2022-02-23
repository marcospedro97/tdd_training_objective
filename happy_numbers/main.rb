# frozen_string_literal: true

class Main
  def self.call(number)
    new(number).exec
  end

  def initialize(number)
    @number = number
    @seen = []
  end

  private

  def exec
    return true if @number == 1
    return false if @seen.include?(@number)

    @seen << @number
    @number = @number.digits.map { |digit| digit**2 }.sum
    exec
  end
end
