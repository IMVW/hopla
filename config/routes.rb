Rails.application.routes.draw do


  # resources :departments, only: [:new, :create, :edit, :update, :destroy]
  resources :departments

  resources :departments do
    resources :shifts, only: [:new, :create]
  end

  resources :shifts, only: [:index, :show]
  devise_for :users
  root to: 'pages#home'

  get 'departments', to: 'departments#index'
  get 'planner', to: 'planner#index'
  get 'shifts', to: 'shifts#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
