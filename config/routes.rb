# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  resources :camp_multi_steps
  namespace :admin do
    resources :users
    resources :camps
  end
  devise_for :users, controllers: {
    registrations: 'registration',
    sessions: 'sessions',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
