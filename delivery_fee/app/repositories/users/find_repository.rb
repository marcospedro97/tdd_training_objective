# frozen_string_literal: true

module Users
  class FindRepository
    def self.call(user_id)
      User.find(user_id)
    end
  end
end
