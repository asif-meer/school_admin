Rails.application.routes.draw do

  resources :students do
    collection do
      post "remove_avatar/:id", to: "students#remove_avatar", as: :delete_avatar
    end
  end
  


  resources :subject_allocations

  get "visitors/contact_us", to: "visitors#contact_us"
  get "visitors/about_us", to: "visitors#about_us"
  resources :employees do
    collection do
      post "remove_avatar/:id", to: "employees#remove_avatar", as: :delete_avatar
    end
    
  end
  
  resources :employee_attendence, only: [:index]

  match "edit_attendence/:id" => "employee_attendence#edit_attendence", :via => :get, as: :edit_attendence
  match "update_attendence/:id", to: "employee_attendence#update_attendence", :via => :post, as: :update_attendence

  resources :employee_positions
  resources :student_categories
  resources :departments
  resources :courses
  resources :batches
  resources :subjects

  # get "admission" => "admission#index", as: :admissions
  get "/admission/new" => "admission#new", as: :new_admission
  post "/admission" => "admission#create"
  # get "/admission/show/:id" => "admission#show", :as => :admission_detail
  # get "/admission/edit/:id" => "admission#edit", :as => :admission_edit
  # delete "/admission/destroy/:id" => "admission#destroy", :as => :delete_admission
  # post "/admission/update/:id" => "admission#update", as: :update_admission

  # routes for school information
  get "general/settings", as: :school_edit
  match '/general/settings/update', to: 'school#update', :via => :post, as: :school_update

  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
