# frozen_string_literal: true

module Goals
  class Base
    attr_accessor :params, :user

    def initialize(params)
      @params = params
      @user = set_user
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
    end
  end
end
