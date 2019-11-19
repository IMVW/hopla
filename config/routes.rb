Rails.application.routes.draw do

  # resources :departments, only: [:new, :create, :edit, :update, :destroy]
  resources :departments
  devise_for :users
  root to: 'planner#index'

  get 'departments', to: 'departments#index'
  get 'planner', to: 'planner#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
