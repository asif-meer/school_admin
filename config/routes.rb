Rails.application.routes.draw do

  # Fees Criteria
  resources :fees_particulars, only: [:destroy, :edit, :update, :show] do
    collection do
      post "types"
    end
  end
  resources :fees_categories
  resources :fees_periods do
    collection do
      get "update_fees_particulars"
    end
  end

  match 'fees_particulars/new/:id' => 'fees_particulars#new', :via => :get, as: :new_fees_particulars
  match 'fees_particulars/create/:id' => 'fees_particulars#create', :via => :post, as: :create_fees_particulars
  match 'fees_particulars/update/:id' => 'fees_particulars#update', :via => :post, as: :update_fees_particulars
  get 'home/index'


  # Test logs with Redis
  match "/log/" => 'home#log', :via => [:post]
  match "/logEvent/" => 'home#log_event', :via => [:post]
  match "/logException/" => 'home#log_exception', :via => [:post]
  # match "/events/" => 'home#events', :via => [:get]
  match "/redis/" => 'home#redis', :via => [:get], :as => :redis


  # Students Criteria
  resources :students do
    collection do
      post "remove_avatar/:id", to: "students#remove_avatar", as: :delete_avatar
    end
  end
  
  # Subjects Criteria
  resources :subject_allocations
  resources :subjects do
    collection do
      get "update_course"
    end
  end
  resources :student_categories

  # Visitors
  get "visitors/contact_us", to: "visitors#contact_us"
  get "visitors/about_us", to: "visitors#about_us"
  

  # Employee Attendance
  match "attendences/employee_attendence" => "attendences#employee_attendence", via: :get, as: :employee_attendence
  match "attendences/edit/:id" => "attendences#edit", via: :get, as: :emp_attendence_edit
  match "attendences/update/:id" => "attendences#update", via: :post, as: :emp_attendence_update
  # match "employee/:employee_id/attendence" => "employee_attendence#edit_attendence", :via => :get, as: :employee_attendence

  # match "edit_attendence/:id" => "employee_attendence#edit_attendence", :via => :get, as: :edit_attendence
  match "attendence/:id", to: "employee_attendence#attendence", :via => :post, as: :update_attendence

  # Employees
  resources :employee_positions
  resources :employees do
    collection do
      post "remove_avatar/:id", to: "employees#remove_avatar", as: :delete_avatar
    end
    
  end

  # Departments
  resources :departments

  # Courses
  resources :courses

  # Batches
  resources :batches
  
  # Admissions
  # get "admission" => "admission#index", as: :admissions
  get "/admission/new" => "admission#new", as: :new_admission
  post "/admission" => "admission#create"
  get "/admission/update_course"
  # get "/admission/show/:id" => "admission#show", :as => :admission_detail
  # get "/admission/edit/:id" => "admission#edit", :as => :admission_edit
  # delete "/admission/destroy/:id" => "admission#destroy", :as => :delete_admission
  # post "/admission/update/:id" => "admission#update", as: :update_admission

  # routes for school information
  get "general/settings", as: :school_edit
  match '/general/settings/update', to: 'school#update', :via => :post, as: :school_update

  ActiveAdmin.routes(self)
  root to: 'home#index'
  devise_for :users
  resources :users
end
