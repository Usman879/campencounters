# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  # get '/search', to: "users#search"
  namespace :admin do
    resources :users
    resources :camps
  end
  devise_for :users, controllers: {
    registrations: 'registration',
    sessions: 'sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
