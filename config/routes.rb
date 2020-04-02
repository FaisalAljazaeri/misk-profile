Rails.application.routes.draw do
  devise_for :student
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Routes for Student resource
  resources :students

  # root path will go to index action on students controller
  root "students#index"
end
