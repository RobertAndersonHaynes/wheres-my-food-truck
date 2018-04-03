Rails.application.routes.draw do
  root 'maps#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: [:index, :show, :destroy, :edit, :update]
  put 'accept/:id', to: 'users#accept', as: :accept_user

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end
end
