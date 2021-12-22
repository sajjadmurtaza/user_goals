# frozen_string_literal: true

class GoalsList < GoalBase
  def self.serialize(goals)
    goals.map { |goal| new(goal).serialize }
  end
end
