Rails.application.routes.draw do
  devise_for :users, path: '/api/users', only: :sessions, controllers: { sessions: 'api/sessions' }

  namespace :api do
    devise_scope :user do
      get :me, to: 'sessions#me'
    end

    resources :ideas do
      collection do
        get :mine
      end
      member do
        post :buy
        post :accept
        post :reject
      end
    end
  end
end
