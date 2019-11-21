Rails.application.routes.draw do
  root to: 'manager_view#dashboard'
  devise_for :users
  resources :departments
  resources :shifts, only: [:index, :show, :edit, :update, :destroy, :create]
  resources :employees, only: [:index, :show, :new, :create, :edit, :update]

  # resources :manager_view, only: [:employees, :hr_overview]
  get '/planner', to: 'departments#index'

  # get 'manager', to: 'manager#index'  get 'shifts', to: 'shifts#index'
  get 'employees', to: 'employees#index'
  get 'mv/employees', to: 'manager_view#hr_overview'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
