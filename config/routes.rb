# frozen_string_literal: true

Rails.application.routes.draw do
  resources :attendance_requests, only: [:new, :create, :destroy]
  resources :attendances
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'
  get '/index', to: 'welcome#index', as: 'index'
  get '/about', to: 'welcome#about', as: 'about'
  get '/contact', to: 'welcome#contact', as: 'contact'
  get '/coordinator/:id', to: 'welcome#show'
  get '/coordinators', to: 'welcome#coordinators'
  get '/information', to: 'attendance_requests#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    get 'admins/backoffice' => 'admins#backoffice'
    get 'coordinators/backoffice' => 'coordinators#coordinators_backoffice'
    # get 'students/backoffice' => 'students#students_backoffice'
    get '/information', to: 'attendance_requests#index'
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
