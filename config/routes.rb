Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'assignments/index'

  get 'assignments/show'

  get 'assignments/new'

  get 'assignments/create'

  get 'assignments/edit'

  get 'assignments/update'

  get 'assignments/destroy'

  get 'students/index'

  get 'students/show'

  get 'students/new'

  get 'students/create'

  get 'students/edit'

  get 'students/update'

  get 'students/destroy'

  get 'teachers/index'

  get 'teachers/show'

  get 'teachers/new'

  get 'teachers/create'

  get 'teachers/edit'

  get 'teachers/update'

  get 'teachers/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
