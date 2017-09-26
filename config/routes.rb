Rails.application.routes.draw do
  root 'sessions#new'

  resources :teachers
  resources :students
  resources :assignments
  resources :sessions, except: [:destroy]
  delete '/logout' => 'sessions#destroy'

end
