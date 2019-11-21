Rails.application.routes.draw do

  # resources :departments, only: [:new, :create, :edit, :update, :destroy]
  resources :departments

  resources :shifts, only: [:index, :show, :edit, :update, :destroy, :create]
  devise_for :users

  resources :employees, only: [:index, :show, :new, :create]

  # resources :manager_view, only: [:employees, :hr_overview]
  get '/planner', to: 'departments#index'

  root to: 'manager_view#dashboard'

  # get 'manager', to: 'manager#index'
  get 'departments', to: 'departments#index'
  get 'shifts', to: 'shifts#index'
  get 'employees', to: 'employees#index'
  get 'mv/employees', to: 'manager_view#hr_overview'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
