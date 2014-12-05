Rails.application.routes.draw do
  devise_for :users, path: '/api/users', only: :sessions, controllers: { sessions: 'api/sessions' }

  namespace :api do
    resources :ideas do
      collection do
        get :mine
      end
    end
  end
end
