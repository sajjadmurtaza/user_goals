# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      namespace :v1 do
        resources :goals, only: %i[index create]
        resources :key_results, only: [:create]
      end
    end
  end
end
