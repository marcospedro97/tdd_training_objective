module Delivery
  class FeeRepository
    def self.call(zip_code:)
      new(zip_code: zip_code).exec
    end

    def initialize(zip_code:)
      @zip_code = zip_code
    end

    def exec
      10.0
    end
  end
end