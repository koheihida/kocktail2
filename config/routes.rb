Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: "posts#index"
  resources :posts do
      collection do
        get 'search'
      end
    end
  resources :keywords do
      collection do
        get 'search'
      end
    end
  resources :titles
end
