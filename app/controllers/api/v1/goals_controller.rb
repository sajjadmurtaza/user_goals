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
        render json: ::GoalsList.serialize(result)
      end

      def update
        result = ::Goals::Update.new(gaol_params).run(id: params[:id])
        render json: result
      end

      def destroy
        result = ::Goals::Destroy.run(id: params[:id])
        render json: 'Successfully deleted' if result
      end

      private

      def gaol_params
        params.require(:goal).permit(:title, :user_id, :start_date, :end_date)
      end
    end
  end
end
