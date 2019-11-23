Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  resources :buddies

  resources :users, :only => :none do
    resource :profile, :only => [:show, :edit, :update]
  end

  resources :courses do
    resources :links
    resources :notes
    resources :discussions
  end

  resources :groups do
    member do
      patch :join
      put :join
    end
    resources :group_announcement
    resources :group_meeting
  end

  match '/home' => 'welcome#index', via: [:get, :post]
  match '/about' => 'welcome#about', via: [:get, :post]
  match '/contact' => 'welcome#contact', via: [:get, :post]
  root 'welcome#welcome'
end
