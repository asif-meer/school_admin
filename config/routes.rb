Rails.application.routes.draw do

  resources :students
  resources :subject_allocations

  get "visitors/contact_us", to: "visitors#contact_us"
  get "visitors/about_us", to: "visitors#about_us"

  resources :employees
  resources :employee_positions
  resources :student_categories
  resources :departments
  resources :courses
  resources :batches
  resources :subjects
  
  # student admission routes here
  get "admission" => "admission#index", as: :admissions
  get "/admission/new" => "admission#new", as: :new_admission
  post "/admission" => "admission#create"
  get "/admission/show/:id" => "admission#show", :as => :admission_detail
  get "/admission/edit/:id" => "admission#edit", :as => :admission_edit
  delete "/admission/destroy/:id" => "admission#destroy", :as => :delete_admission
  post "/admission/update/:id" => "admission#update", as: :update_admission

  # routes for school information
  get "general/settings", as: :school_edit
  match '/general/settings/update', to: 'school#update', :via => :post, as: :school_update

  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
