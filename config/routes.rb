Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams, only: [:index, :show, :new, :create]
  resources :players, only: [:index, :show, :new, :create]
  resources :fantasy_teams, only: [:index, :show, :new, :create]
end
