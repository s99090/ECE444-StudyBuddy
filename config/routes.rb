Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  resources :buddies, :notes, :discussions

  resources :users, :only => :none do
    resource :profile
  end

  resources :courses do 
    resources :links
  end

  resources :groups do
    resources :group_announcement
    resources :group_meeting
  end

  match '/home' => 'welcome#index', via: [:get, :post]
  match '/about' => 'welcome#about', via: [:get, :post]
  match '/contact' => 'welcome#contact', via: [:get, :post]
  root 'welcome#welcome'
end
