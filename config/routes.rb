Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  resources :groups, :buddies, :notes, :discussions

  resources :courses do 
    resources :links
  end

  root 'welcome#index'
end
