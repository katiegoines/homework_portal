Rails.application.routes.draw do

  root 'users#index'

  resources :users, only: [:index, :new, :create]
  resources :teachers
  resources :students
  resources :assignments
  resources :sessions, except: [:destroy]
  delete '/logout' => 'sessions#destroy'

end
