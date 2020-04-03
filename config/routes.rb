Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Routes for Student resource
  get 'students', to: 'students#index', as: :students
  get 'students/:id', to: 'students#show', as: :student
  get 'students/:id/edit', to: 'students#edit', as: :edit_student
  patch 'students/:id', to: 'students#update'

  # root path will go to index action on students controller
  root "students#index"
end
