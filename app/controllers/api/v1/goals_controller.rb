# frozen_string_literal: true

module Api
  module V1
    class GoalsController < ApplicationController
      def create
        result = ::Goals::Create.new(gaol_params).run

        render json: result
      end

      def index
        result = Goal.by_user(gaol_params[:user_id])
        p ' ======'
        p result

        render json: ::GoalsList.serialize(result)
      end

      private

      def gaol_params
        params.require(:goal).permit(:title, :user_id, :start_date, :end_date)
      end
    end
  end
end
