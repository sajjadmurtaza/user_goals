# frozen_string_literal: true

module Goals
  class Update < Base
    def run(id:)
      goal = goal(id)
      goal.update(params)

      ::GoalObject.serialize(goal)
    end

    private

    def goal(id)
      Goal.find_by_id id
    end
  end
end
