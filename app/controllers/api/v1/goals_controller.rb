# frozen_string_literal: true

module Api
  module V1
    class GoalsController < ApplicationController
      def create
        result = ::Goals::Create.new(gaol_params).run

        render json: result.to_json
      end

      def index
        result = Goal.by_user(params[:user_id])

        render json: ::GoalsList.serialize(result)
      end

      private

      def gaol_params
        params.permit(:title, :user_id, :start_date, :end_date)
      end
    end
  end
end
