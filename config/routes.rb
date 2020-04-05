Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Routes for Student resource
  get 'students', to: 'students#index', as: :students
  get 'students/:id', to: 'students#show', as: :student
  get 'students/:id/edit', to: 'students#edit', as: :edit_student
  patch 'students/:id', to: 'students#update'
  get 'students/:id/skills', to: 'students#skills', as: :student_skills
  delete 'students/:id/skills', to: 'students#remove_skill', as: :remove_student_skill
  patch 'students/:id/skills', to: 'students#add_skill', as: :add_student_skill

  # Routes for Projects Controller
  get 'projects', to: 'projects#index', as: :projects
  get 'projects/new', to: 'projects#new', as: :new_project
  post 'projects', to: 'projects#create'
  get 'projects/:id', to: 'projects#show', as: :project
  get 'projects/:id/edit', to: 'projects#edit', as: :edit_project
  patch 'projects/:id', to: 'projects#update'
  delete 'projects/:id', to: 'projects#destroy', as: :destroy_project

  # root path will go to index action on students controller
  root "students#index"
end
