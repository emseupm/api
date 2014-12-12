Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, path: '/api/users', only: :sessions, controllers: { sessions: 'api/sessions' }

  namespace :api do
    devise_scope :user do
      get :me, to: 'sessions#me'
    end

    resources :ideas do
      collection do
        get :mine
        get :search
      end
        
      resources :comments, shallow: true

      member do
        post :buy
        post :accept
        post :reject
      end

      resources :votes
    end
  end
end
