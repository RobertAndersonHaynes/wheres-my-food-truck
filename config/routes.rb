Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: [:index, :show, :destroy, :edit, :update]
  put 'accept/:id', to: 'users#accept', as: :accept_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
