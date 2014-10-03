Rails.application.routes.draw do

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
  get "/admission" => "admission#new", as: :new_admission
  post "/admission" => "admission#create"

  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
