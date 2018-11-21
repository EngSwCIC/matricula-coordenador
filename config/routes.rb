Rails.application.routes.draw do  
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'welcome#index'
  get '/index', to: 'welcome#index', as:'index'
  get '/about', to: 'welcome#about', as:'about'
  get '/services', to: 'welcome#services', as:'services'
  get '/contact', to: 'welcome#contact', as:'contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    get 'admins/backoffice' => 'admins#backoffice'
    get 'coordinators/backoffice' => 'coordinators#coordinators_backoffice'
    #get 'students/backoffice' => 'students#students_backoffice'
  end


  authenticated :user do
    namespace :admins do
      resources :coordinators
    end
  end

  resources :students

  # Credit forms routes
  resources :credit_forms
  #get 'credit_forms/new', to: 'credit_forms#new'
end
