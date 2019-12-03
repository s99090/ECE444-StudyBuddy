Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      :omniauth_callbacks => "users/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  resources :buddies do
   
    resources :meetings do
      resources :comments
    end
  end
  patch '/buddies/:buddy_id/:current_user_id/add_interested', :to => "buddies#add_interested", as: 'buddy_add_interested'

  resources :users, :only => :none do
    resource :profile, :only => [:show, :edit, :update]
  end

  resources :professors

  resources :courses do
    resources :links do
      patch :addUpvote
      patch :addDownvote
    end
    resources :notes
    resources :discussions do
      resources :comments
    end
  end

  resources :groups do
    member do
      patch :join
      put :join
    end
    resources :events do
      resources :comments
    end
    resources :groupchats do
      resources :comments
    end
    # resources :group_announcement
    # resources :group_meeting
  end

  match '/home' => 'welcome#index', via: [:get, :post]
  match '/about' => 'welcome#about', via: [:get, :post]
  match '/contact' => 'welcome#contact', via: [:get, :post]
  match '/sitemap' => 'welcome#sitemap', via: [:get, :post]
  match '/faq' => 'welcome#faq', via: [:get, :post]
  match '/termsandconditions' => 'welcome#termsandconditions', via: [:get, :post]
  match '/privacy' => 'welcome#privacy', via: [:get, :post]

  post '/contact_us_submission', to: 'welcome#contact_us_submission', as: 'contact_us_submission'

  get '/:token/confirm_email/', :to => "buddies#confirm_email", as: 'confirm_email'
  root 'welcome#welcome'
end
