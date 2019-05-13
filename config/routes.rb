# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :dishs
    get 'dishs/:id/restaurants', to: 'dishs#get_restaurants'
    resources :restaurants
    get 'restaurants/:id/dishs', to: 'restaurants#get_dishs'
  end
end
