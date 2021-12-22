# frozen_string_literal: true

class GoalBase
  attr_accessor :goal

  def initialize(goal)
    @goal = goal
  end

  def serialize
    {
      title: goal.title,
      start_date: goal.start_date,
      end_date: goal.start_date,
      progress: KeyResult.progress(goal)
    }
  end
end
