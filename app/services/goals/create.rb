# frozen_string_literal: true

module Goals
  class Create < Base
    def run
      return empty_user_error_message if @user.nil?

      ::GoalObject.serialize(goal)
    end

    private

    def goal
      Goal.create(params)
    end

    def empty_user_error_message
      'Please provide correct existing user id.'
    end
  end
end
