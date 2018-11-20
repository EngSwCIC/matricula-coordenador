Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    get 'admins/backoffice' => 'admins#backoffice'
    get 'coordinators/backoffice' => 'coordinators#coordinators_backoffice'
  end


  authenticated :user do
    namespace :admins do
      resources :coordinators
      resources :students
    end
  end

  # Credit forms routes
  resources :credit_forms
  #get 'credit_forms/new', to: 'credit_forms#new'
end
