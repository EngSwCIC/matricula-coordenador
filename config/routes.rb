# frozen_string_literal: true

Rails.application.routes.draw do
  resources :attendance_requests, except: :edit
  get 'attendance_requests/:id/perform_attendance', to: 'attendance_requests#edit', as: 'perform_attendance'

  resources :reminders
  resources :attendance_requests

  match "attendance_requests/filter_by_priority" => "attendance_requests#filter_by_priority", :via => :post
  match "attendances/filter_by_priority" => "attendances#filter_by_priority", :via => :post
  
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'
  get '/index', to: 'welcome#index', as: 'index'
  get '/about', to: 'welcome#about', as: 'about'
  get '/contact', to: 'welcome#contact', as: 'contact'
  get '/coordinator/:id', to: 'welcome#show'
  get '/coordinators', to: 'welcome#coordinators'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    get 'admins/backoffice' => 'admins#backoffice'
    get 'coordinators/backoffice' => 'coordinators#coordinators_backoffice'
    # get 'students/backoffice' => 'students#students_backoffice'
  end

  authenticated :user do
    namespace :admins do
      resources :coordinators, except: :show
      resources :abouts, only: %i[index edit update]
    end
  end

  authenticated :user do
    resources :students
  end

  authenticated :user do
    namespace :coordinators do
      resources :infos
      # put '/attempt', to: 'attendances#attempt'
    end
  end

  # Credit forms routes
  resources :credit_forms
  # get 'credit_forms/new', to: 'credit_forms#new'
end
