Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  resources :groups do 
    resources :group_announcement, :group_meeting
  end
  resources :buddies, :courses, :notes, :links, :discussions

  root 'welcome#index'
end
