Rails.application.routes.draw do
  resources :courses
  resources :batches
  resources :subjects
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
