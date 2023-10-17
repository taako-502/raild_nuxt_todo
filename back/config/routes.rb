# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users do
      resources :tasks, only: [:create]
    end
  end
end
