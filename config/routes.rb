# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  resources :admin
  devise_for :users, controllers: { registrations: 'registration' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
