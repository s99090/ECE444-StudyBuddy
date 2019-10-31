Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  resources :courses
  resources :notes
  resources :discussions
  resources :links
  root 'welcome#index'
end
