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
      end_date: goal.end_date,
      progress: KeyResult.progress(goal),
      key_results: key_results
    }
  end

  private

  def key_results
    goal.key_results.map do |key_result|
      {
        title: key_result.title,
        status: key_result.status.split('_').map(&:capitalize).join(' ')
      }
    end
  end
end
