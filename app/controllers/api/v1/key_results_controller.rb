# frozen_string_literal: true

module Api
  module V1
    class KeyResultsController < ApplicationController
      def create
        key_result = KeyResult.new(key_result_params)

        if key_result.save
          render json: key_result
        else
          render json: key_result.errors.full_messages
        end
      end

      private

      def key_result_params
        params.require(:key_result).permit(:title, :status, :goal_id)
      end
    end
  end
end
