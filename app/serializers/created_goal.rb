# frozen_string_literal: true

class CreatedGoal < GoalBase
  def self.serialize(goal)
    return goal.errors.full_messages if goal.errors.present?

    new(goal).serialize
  end
end
