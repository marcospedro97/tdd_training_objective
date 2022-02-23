# frozen_string_literal: true

class Main
  def self.call(max:, divisors:, method: nil)
    new(max, divisors).send(method || :exec)
  end

  def initialize(max, divisors)
    @max = max
    @divisors = divisors
  end

  private

  def exec
    @divisors.map do |divisor|
      (1...@max).select { |n| (n % divisor).zero? }
    end.flatten.uniq.sort
  end

  def sum
    exec.sum
  end
end
