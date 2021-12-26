# frozen_string_literal: true

module Goals
  class Destroy
    def self.run(id:)
      goal = Goal.find_by_id id
      return false if goal.nil?

      goal.destroy
    end
  end
end
