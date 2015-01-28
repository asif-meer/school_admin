Rails.application.routes.draw do

  resources :classrooms

  resources :sessions

  # Fees Criteria
  resources :fees_particulars, only: [:destroy, :edit, :update, :show] do
    collection do
      post "types"
      get "update_students"
    end
  end
  resources :fees_categories do
    collection do
      get "fees_index"
    end
  end
  resources :fees_periods do
    collection do
      get "update_fees_particulars"
    end
  end

  get "home/bootstrap_form_test"

  match 'fees_particulars/new/:id' => 'fees_particulars#new', :via => :get, as: :new_fees_particulars
  match 'fees_particulars/create/:id' => 'fees_particulars#create', :via => :post, as: :create_fees_particulars
  match 'fees_particulars/update/:id' => 'fees_particulars#update', :via => :post, as: :update_fees_particulars
  get 'home/index'


  # Test logs with Redis
  # match "/log/" => 'home#log', :via => [:post]
  # match "/logEvent/" => 'home#log_event', :via => [:post]
  # match "/logException/" => 'home#log_exception', :via => [:post]
  # # match "/events/" => 'home#events', :via => [:get]
  # match "/redis/" => 'home#redis', :via => [:get], :as => :redis


  # Students Criteria
  resources :students do
    collection do
      post "remove_avatar/:id", to: "students#remove_avatar", as: :delete_avatar
      get "admissions"
    end
  end
  
  # Subjects Criteria
  resources :subject_allocations do
    collection do
      delete 'destroy_multiple'
      get "update_course"
      get "update_batch"
      get "update_department"
    end
  end
  resources :subjects do
    collection do
      get "update_course"
      get "list"
      delete 'destroy_multiple'
      get "update_course_for_search"
    end
  end
  resources :student_categories

  # Visitors
  # get "visitors/contact_us", to: "visitors#contact_us"
  # get "visitors/about_us", to: "visitors#about_us"
  

  # Employee Attendance
  resources :employee_attendance, only: [:employee_attendance_details] do
    collection do
      get "employee_attendance_details"
    end
  end

  # Employees
  resources :employee_positions
  resources :employees do
    collection do
      post "remove_avatar/:id", to: "employees#remove_avatar", as: :delete_avatar
      get "human_resources"
    end
    
  end

  # Departments
  resources :departments

  # Courses
  resources :courses do
    collection do
      delete 'destroy_multiple'
    end
  end
  # match "courses/destroy/:id" => "courses#destroy", via: :delete, as: :destroy_course

  # Batches
  resources :batches do
    collection do
      delete 'destroy_multiple'
      get 'update_batches'
    end
  end
  
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
  authenticated :user do
    root :to => "home#index"
  end
  unauthenticated :user do
    devise_scope :user do 
      get "/" => "devise/sessions#new"
    end
  end

  devise_scope :user do

  end
  # root to: 'devise/sessions#new '
  devise_for :users, :controllers => { :registrations => "registrations" } 
  resources :users
end


# For Production Enviroment
# if Rails.env.production?
#   devise_for :users, :controllers => { :registrations => "registrations" } 
# else
#   devise_for :users
# end
