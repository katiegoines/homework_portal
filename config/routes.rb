Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :assignments, except: [:destroy]
  delete 'assignments/:id' => 'assignments#destroy'
  resources :sessions, except: [:destroy]
  delete '/logout' => 'sessions#destroy'
end
