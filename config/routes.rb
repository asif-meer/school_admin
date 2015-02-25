Rails.application.routes.draw do

  # School Classes
  # resources :classes
  match "/classes/class-:class_name/", to: "classes#show", via: :get, as: :class_name
  match "/classes/:class_name/edit", to: "classes#edit", via: :get, as: :edit_class
  match "/classes/:class_name/update/", to: "classes#update", via: :patch, as: :update_class
  match "/classes/new/", to: "classes#new", via: :get, as: :new_class
  match "/classes/create/", to: "classes#create", via: :post, as: :create_class
  match "/classes/:class_name/destroy/", to: "classes#destroy", via: :delete, as: :destroy_class
  match "/classes/", to: "classes#index", via: :get, as: :classes
  match "classes/:id/class_details/", to: "classes#class_details", via: :get, as: :class_details
  match "classes/:id/class_details_for_periods/", to: "classes#class_details_for_periods", via: :get, as: :class_details_for_periods
  match "classes/destroy_multiple/", to: "classes#destroy_multiple", via: :delete, as: :destroy_multiple_classes

  resources :classrooms do
    collection do
      delete 'destroy_multiple'
    end
  end

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
      delete 'destroy_multiple'
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
      delete 'destroy_multiple'
      # get ":employee_position_id/new", to: "employees#teacher_new", as: :new_teacher
      # post ":employee_position_id/create", to: "employees#teacher_create", as: :create_teacher
      get ":id/classes", to: "employees#classes", as: :teacher_class
    end
  end

  # Teachers
  get "/teachers", to: "teachers#index", as: :teachers
  get "/teachers/new", to: "teachers#new", as: :new_teacher
  post "/teachers/create", to: "teachers#create", as: :create_teacher
  get "/teachers/:id/edit", to: "teachers#edit", as: :edit_teacher
  post "/teachers/:id/update", to: "teachers#update", as: :update_teacher
  get "/teachers/:id", to: "teachers#show", as: :teacher
  delete "/teachers/:id/destroy", to: "teachers#destroy", as: :teacher_destroy
  delete "teachers/destroy_multiple/", to: "teachers#destroy_multiple", as: :destroy_multiple_teachers
  post "teacher/:id/remove_avatar", to: "teachers#remove_avatar", as: :delete_avatar_teacher
  # match "/classes/:class_name/edit", to: "classes#edit", via: :get, as: :edit_class
  # match "/classes/:class_name/update/", to: "classes#update", via: :patch, as: :update_class
  # match "/classes/new/", to: "classes#new", via: :get, as: :new_class
  # match "/classes/create/", to: "classes#create", via: :post, as: :create_class
  # match "/classes/:class_name/destroy/", to: "classes#destroy", via: :delete, as: :destroy_class
  # match "/classes/", to: "classes#index", via: :get, as: :classes

  resources :class_teachers, only: [:create, :destroy] do
    collection do
      delete ":id/destroy", to: "class_teachers#destroy", as: :destroy
    end
  end
  resources :classroom_teachers, only: [:create, :destroy] do
    collection do
      delete ":id/destroy", to: "classroom_teachers#destroy", as: :destroy
    end
  end

  # Lessons
  resources :lessons, only: [:destroy] do
    collection do
      match ":school_class_id/lessons", to: "lessons#new", via: :get, as: :new
      match ":school_class_id/create", to: "lessons#create", via: :post, as: :create
    end
  end

  resources :periods do
    collection do
      delete 'destroy_multiple'
    end
  end

  #Timetable
  # resources :time_table do
  #   collection do
  #     get 'view'
  #     get 'allocate_subjects'
  #   end
  # end

  get "/time_table", to: "time_table#index", as: :time_table
  get "/time_table/view", to: "time_table#view"
  get "/time_table/allocate_subjects", to: "time_table#allocate_subjects"
  get "/time_table/pdf/:class_name", to: "time_table#pdf_time_table", as: :pdf_time_table
  post "/time_table/:class_name/update/:period_id", to: "time_table#update", as: :update_time_table
  post "/time_table/:class_name/remove_subject/:period_id", to: "time_table#remove_subject", as: :remove_subject


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
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
  devise_for :users, :controllers => { :registrations => "registrations" } 
  resources :users
end


# For Production Enviroment
# if Rails.env.production?
#   devise_for :users, :controllers => { :registrations => "registrations" } 
# else
#   devise_for :users
# end
